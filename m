Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0A5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N+G4KHtj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bUpMjpsv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=02RmMrYDuqe1ZwKJfkDpL+ozKnlBKLAvKi1f/ZPO+eM=; b=N+G4KHtjaGNGrh
	kP03eLPvn3hdknb2Yna/HyYhpW1Oa8lSBquv5UDU6PDyM74gt7sJ8vljaMxRcryZb4Tpm+mfXeER9
	eB6BDhYxfo6FuKvmhMnYEx50LkRHRk0Xj07XXkJ0+OrAX8oVORtQsKH+9/adjBP46bbMs8Wj4xTDx
	dlM72iT785Cg6g+Kt8Gbp9jgolw1iDriAJnmQfK+APIiP8CsgH+RB/fPIhnl9wX2WpHNM/Ia8p/cv
	nmQNxIIMx9jDh+EyM00qIUaIL50DMOlvBEou92GAp4NgVeoMjF/TLZoT+RVssDsgNQAL20T3Uvy60
	4A8cvo7AvDdo6A6FiJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiYc-0000000Eww0-2o5j;
	Sat, 07 Nov 2026 15:42:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPiYb-0000000Ewvu-32aC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 15:42:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D77941711;
	Sat,  7 Nov 2026 15:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45D91F0089F;
	Sat,  7 Nov 2026 15:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794066137;
	bh=02RmMrYDuqe1ZwKJfkDpL+ozKnlBKLAvKi1f/ZPO+eM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bUpMjpsvKy6zoWTeJK5ROw+PaPQev2GFzhG3yHzZ+c+NRw5wn4jz8dbWU0DOI7YkU
	 vkDgeuO0hqY9h0Dn7fqZcEwDNmjRHvhRzA8de5jar+Sxa1cpRMt7oQzxRLqJDedr7p
	 yeIvwL56z2nNP8Hu/WREF5NnHya6lMTWjVHF7GO2nGjIfH6IdUrg63Uye6iJdryNVC
	 DbSTG3j6gKfD219c5PM1rTLkm7MeOlouNdbpd72L4o45WTRDx/ptmcDMaeSGqKgevF
	 QnaRIEJWQ+DRS9b2EuHgV+oHHkwORNT7hAi0FXiuYFS+xMABbHvXwdhAZm5/9ksQqy
	 A5la3nD6zn/WQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D59B02AB3711;
	Sat, 07 Nov 2026 15:42:13 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: fsl: imx-card: fix DT node reference leak on
 unbind
From: Mark Brown <broonie@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261104024057.1508822-1-vulab@iscas.ac.cn>
References: <20261104024057.1508822-1-vulab@iscas.ac.cn>
Date: Sat, 07 Nov 2026 15:42:12 +0000
Message-Id: <179406613243.3424803.16218252867759690236.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1l5Z1GoGtVhro8Tj5KzjbjIg1LqSe7tU5rSYeviWp0k=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeu139dPVW4MyTcxTnNCwTn2b6qPHrnsR6VStB060lr
 8+JZ65L7ihlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBE8rQZGQ7/SZw2MeB/+t6u
 L0WmJ/pUZy9p1SuSdLxjdmrxZWHfx48Y/peZdad6n+6fez9KZz6b1eXj626Zv74UmVS0apHC1zK
 DuwwA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> imx_card_parse_of() takes references on the CPU and codec device nodes
> with snd_soc_of_get_dlc() and snd_soc_of_get_dai_link_codecs() and
> stores them in the link's component arrays. The driver has no remove
> callback and the ASoC core does not drop these references when the card
> is unregistered, so unbinding the platform device or unloading the
> module leaks one device node reference per CPU and codec.

> +static void imx_card_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
> +	struct snd_soc_dai_link *link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, link) {
> +		snd_soc_of_put_dai_link_cpus(link);
> +		snd_soc_of_put_dai_link_codecs(link);
> +	}
> +}
> +
>  static const struct of_device_id imx_card_dt_ids[] = {
>  	{ .compatible = "fsl,imx-audio-card", },
>  	{ },
> @@ -940,6 +952,7 @@ static struct platform_driver imx_card_driver = {
>  		.of_match_table = imx_card_dt_ids,
>  	},
>  	.probe = imx_card_probe,
> +	.remove = imx_card_remove,
>  };

This only runs on remove so we've got the same issue if anything goes
wrong during probe (eg, deferral).

-- 
Mark Brown <broonie@kernel.org>

