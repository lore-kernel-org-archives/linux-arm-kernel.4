Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2EF606A833
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2uJ/hlDZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OSTdCAqG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9HvdgseMfTKpHE8dS7B3pYeHdBQRYZw5ymckPY9PWeA=; b=2uJ/hlDZDqkA6G
	DfqJ/C1jez4324pjzMqU1pp2pvrt4K3Kq3B1vz5fJrWdsMgMTrV0/rgZmQr/itMNowF/uhd/fUKMY
	dqm01ZzeCG9Lq9j4TFJbA1NuCdpY61ERO46pIxoHWWK+qwFoDdWN8rUrte7XrWctjSLyHzP+WebNl
	oqU8BJKoDfte3d+MvV46FnkwaSUWS5dpMQHOh9eJn07512Ndhqle4mX5703eNOMMbeurSDELJikcx
	d8RV+0M/ph2+EF7FiE6pvajo+cIuOn8mVPpj0hV1lKSsHsJnvFq3lKOEYddnFJgUxpQ9UuDI8I7TL
	Q0D3wY6k0dETUNSeXqqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3VS-0000000CIB0-3y40;
	Thu, 19 Nov 2026 14:52:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3VR-0000000CIAj-25hz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:52:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F046F44407;
	Thu, 19 Nov 2026 14:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E661F000C5;
	Thu, 19 Nov 2026 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795099976;
	bh=9HvdgseMfTKpHE8dS7B3pYeHdBQRYZw5ymckPY9PWeA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OSTdCAqGwAjilRcTlg4QnCf4oEeBAfqTv/gDQYUG2FpPEPB/n8EunHLn/ONPaXpOu
	 SveUU66MKBns7yz2FK4OhCBjxYp1PDtv1le5N1J++22XgFxvAKocSTYouN8buMMtOc
	 q8nU6wmgmzv0fx7asYyJsuYH8mlXiUmRrtDC9etNXqNBfNRxc9qDmbE99UFyUyYn8W
	 OP3tIju7rPcyzu+qRKdetAwV5lNB58iA+mtwpfLteNmvIyKpcTryoxRGXnPbBlF9Ho
	 Spe1tuIdFhF+e4DgQTsv9g8ynhmtkuDo7VL+SvcGktdWX7sDpW0CEkq/nCJLidF9N7
	 m6NVjjBWc24vw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: versatile-icst: release regmap on registration
 failure
From: Brian Masney <masneyb@kernel.org>
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: linusw@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
 jbrunet+clk@baylibre.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
References: <1795076093787-3-ba1f065a@mail.zgclab.edu.cn>
Date: Thu, 19 Nov 2026 09:52:51 -0500
Message-Id: <179509997129.279270.1694900680492734463.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=B3WrOR4IcxJX+5GntM1nT2+WMxCDlN3APdPaTM4MK4I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+87oYxPGlPtwbYn+L9dRvmymhj7jua76KFkpv0OPeM
 P2FzUb5jlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZSc4/hF3Ot+UztXB4OA3GX
 xeeyp+7p2T7Xas50j0qF/Xt/OvDYn2L4H5u/5uhGe8lDG5oN9z54FcvnkSsl98Ht59pWeZ+vt9V
 TeAA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Wang,

> icst_clk_register() creates a non-devm regmap with regmap_init_mmio() and
> hands it to icst_clk_setup(), which on clk_register() failure only frees
> its own structs and drops the regmap pointer, so the regmap and its
> debugfs entry leak permanently. A name clash is a natural trigger: a DT
> with N same-named auxosc children registers "osc" once and then fails
> -EEXIST on every subsequent registration, leaking N-1 regmaps per boot.
> 
> Release the regmap with regmap_exit() when icst_clk_setup() fails.
> 
> Signed-off-by: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
> Fixes: 179c8fb3c2a6 ("clk: versatile-icst: convert to use regmap")
>
> diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
> index 37334afee040..e9c7353aa5d5 100644
> --- a/drivers/clk/versatile/clk-icst.c
> +++ b/drivers/clk/versatile/clk-icst.c
> @@ -407,14 +407,18 @@ struct clk *icst_clk_register(struct device *dev,
>  		.reg_stride = 4,
>  	};
>  	struct regmap *map;
> +	struct clk *clk;
>  
>  	map = regmap_init_mmio(dev, base, &icst_regmap_conf);
>  	if (IS_ERR(map)) {
>  		pr_err("could not initialize ICST regmap\n");
>  		return ERR_CAST(map);
>  	}
> -	return icst_clk_setup(dev, desc, name, parent_name, map,
> -			      ICST_VERSATILE);
> +	clk = icst_clk_setup(dev, desc, name, parent_name, map, ICST_VERSATILE);
> +	if (IS_ERR(clk))
> +		regmap_exit(map);

There is a struct dev here, so devm_regmap_init_mmio() should fix this
in a cleaner way.

Brian

-- 
Brian Masney <masneyb@kernel.org>

