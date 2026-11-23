Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950FE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHHfHrGN;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OGx4r+fe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QjXQMNryhuvAvTuJVIUvtiTRHIcheq2l+6vCggwxoWY=; b=dHHfHrGN/Y8k7qmvrAsEYwW2H+
	9dgB1hJt/EAvoz07CQwjcRJ559Kq5T6mS5501WQnJb2rIiJuiDrDp9grFQp3EGKswGngzerbum2iS
	zpIy/kx1LFIVBMfJtXx/60U1Of+KbNSjPTGV5KzT38HKj0kFmtEISVja3PIjywf47IWE7yosda9vj
	zOnsUUNKFe72Yg8XMKiKQYiSbcRQobABluAa3dLcjZCG8E6IIU1SN+3NuO3AYT3uXbpyIfA+veirh
	1HUi9PVu8BeBqx/oJmHINSklCj99TndOeD+d5Lf/BtIQdmlOik1Vpfw4SXmPrMeX3dFZ94iOkcgUv
	fGb3nTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMQ-00000003CPq-1GHC;
	Mon, 23 Nov 2026 11:37:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMN-00000003CPJ-48vh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:37:25 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C1F3177;
	Mon, 23 Nov 2026 12:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795433690;
	bh=efBUn+KMT7fQIEAsOONhxg/wXG2a/zfIvlMf5DPX1Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGx4r+fetQOlAWhbjarDIbVCklN3ZQXCUPUp4J2gVVno0l61nyedpk7I0KDPbnkJm
	 R/gxt64WDJ4ZnR8bxORwWx5eT+vxd/pkC5IV4QbNh6K1YINcol42KR0qLQ1dX3ljlC
	 S3xQBleXSIPu/WQR0KlYfNx4Hhezjjf/O1uGD8mE=
Date: Mon, 23 Nov 2026 13:37:21 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Paul Elder <paul.elder+renesas@ideasonboard.com>,
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 11/15] pmdomain: renesas: r8a78000: Drop MDLC name
 comment
Message-ID: <20261123113721.GH3010398@killaraus.ideasonboard.com>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <11c375d15b5073212ca79e11330e422539eae4b5.1795029012.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <11c375d15b5073212ca79e11330e422539eae4b5.1795029012.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033724_196822_682E25EF 
X-CRM114-Status: GOOD (  17.63  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 08:44:59PM +0100, Geert Uytterhoeven wrote:
> There is no need to document Module Controller base addresses in
> mdlc_info tables, as a mod_map initializer already contains the Module
> Controller's name.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v5:
>   - New.
> ---
>  drivers/pmdomain/renesas/r8a78000-mdlc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> index 75de869872de9e82..1ace1fb10870f646 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> @@ -299,7 +299,7 @@ static const struct mod_map r8a78000_mdlc_perw_mod_default[] = {
>  
>  static const struct mdlc_info r8a78000_mdlc_default[] = {
>  	{
> -		.base = 0xc05d0000 /* mdlc_perw */,
> +		.base = 0xc05d0000,
>  		.mod_map = r8a78000_mdlc_perw_mod_default,
>  	},
>  	{ /* sentinel */ }

-- 
Regards,

Laurent Pinchart

