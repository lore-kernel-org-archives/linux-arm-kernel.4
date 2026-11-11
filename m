Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12832606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szqOXMXZ;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=OvYvZJQ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BKB9YU9G4hYp/Q9/iLpzesM8JvO0PHOtL0Jo4MQjYbA=; b=szqOXMXZMMnD4qtrp7kOQ/hX6z
	w3gTmrBnIPkEWk4tJplaHmgAuM6qN+aRJszJwaFhJuBum//NE1+lXom0/nsYWjzz0+//McF48gMwp
	Rf2BUAo+Aeighx6Fapxfzv4ThDlVUj1AB3PWpTC1Nd67Zols/R7WNZLI4f8coF8cYxF/+fVMzILoX
	XOMuWqzTDzfz68q7olThit2EgU8FQTUXYQ+HnVjUQdFrOyhDvoFuZgkV+pLFIJIMF6X3b5O3dwy/G
	2znOXBEUnRyp0Cz2kcU1nUziInFPWTz7Lo4EOtnvxmD/EIkF0EGkkIvCF6E6g9RUlRHD8hjq5D2nx
	tHcM/Bag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2YZ-00000005rHI-3eon;
	Wed, 11 Nov 2026 07:15:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2YX-00000005rGs-0npF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 07:15:42 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DB69BE;
	Wed, 11 Nov 2026 08:13:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794381196;
	bh=EOOOdZn6ZuJOJZmkzIxD+ZiRU1z3rhPSZ6gEaHREQqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OvYvZJQ36wbEqBaoCTqk/AT+dQKmJxFV+LBJ0YlnttVGAFcwDA8DUaUpVvnpanuig
	 NdHbS5DEzwQBgoQ1HzVSsQGmHxH0W5BvVq3VgD0vOj5rjmZANVMFho9Lzx6iDiClbd
	 lxrOuITt57HN0vI3xc370AdDQamlxjrP874sU0CQ=
Date: Wed, 11 Nov 2026 09:15:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, Jacopo Mondi <jacopo@jmondi.org>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: nxp: imx8-isi: remove kzalloc_objs
Message-ID: <20261111071538.GD86558@killaraus.ideasonboard.com>
References: <20261111022822.67474-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111022822.67474-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_231541_400423_728B8A52 
X-CRM114-Status: GOOD (  20.55  )
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

Please see my comments on v1.

On Tue, Nov 10, 2026 at 06:28:22PM -0800, Rosen Penev wrote:
> Use a flexible array member to combine allocations.
> 
> It looks like pipes never gets freed anywhere. Meaning this effectively
> fixes a memory leak.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v3: use devm_kzalloc_flex
>  v2: add fixes tag, fix typo, and move pdata assignment to original
>  place.
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 10 ++++------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 2005584a1215..dcf6c25d7faa 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -473,24 +473,22 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
>  
>  static int mxc_isi_probe(struct platform_device *pdev)
>  {
> +	const struct mxc_isi_plat_data *pdata;
>  	struct device *dev = &pdev->dev;
>  	struct mxc_isi_dev *isi;
>  	unsigned int dma_size;
>  	unsigned int i;
>  	int ret = 0;
>  
> -	isi = devm_kzalloc_obj(dev, *isi);
> +	pdata = of_device_get_match_data(dev);
> +	isi = devm_kzalloc_flex(dev, *isi, pipes, pdata->num_channels);
>  	if (!isi)
>  		return -ENOMEM;
>  
>  	isi->dev = dev;
>  	platform_set_drvdata(pdev, isi);
>  
> -	isi->pdata = of_device_get_match_data(dev);
> -
> -	isi->pipes = kzalloc_objs(isi->pipes[0], isi->pdata->num_channels);
> -	if (!isi->pipes)
> -		return -ENOMEM;
> +	isi->pdata = pdata;
>  
>  	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
>  	if (isi->num_clks < 0)
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..3165a65391c1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -297,7 +297,6 @@ struct mxc_isi_dev {
>  	struct regmap			*gasket;
>  
>  	struct mxc_isi_crossbar		crossbar;
> -	struct mxc_isi_pipe		*pipes;
>  	struct mxc_isi_m2m		m2m;
>  
>  	struct media_device		media_dev;
> @@ -305,6 +304,8 @@ struct mxc_isi_dev {
>  	struct v4l2_async_notifier	notifier;
>  
>  	struct dentry			*debugfs_root;
> +
> +	struct mxc_isi_pipe		pipes[];
>  };
>  
>  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;

-- 
Regards,

Laurent Pinchart

