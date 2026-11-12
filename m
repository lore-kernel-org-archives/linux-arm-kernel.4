Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79ED60A2623
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fk4RaRnE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EF/p6PI8;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=blM14kIw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NPENMsmu3+BS94VMSAUvkedwRU3NJYclxTKT7IXQmWU=; b=Fk4RaRnEO85+qX
	VxawczhmNzrq5OreCJ34a8xKeWzGrrhu8YmJMnhOQPVk8Zx1UJgCOYd2DkCTztmzLFMLHeyXMCC9y
	6my32KgpCHQcpRCh983zQMhUi+V2jaIl7YsiqhJt5A4v2lnOSc6HwKdeVvmSwPM04Vru0YYGm0/Zu
	iBnmTi57ZrJm+AQpEF+nQgFDoaEi+4q0qN9qjcZGRcsPeR2gIGLez+XGhBpIHzhRGlgv9la6zfHRs
	a8Y3hEoIot5+glvRzWSTcgA9WBBdbOF/0L+KQeULH19InwEz81YOELQp3LZG577pPmOqRTn2WqNvU
	QR0pdyOkSW9d292caYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXr2-0000000Ae9x-3avX;
	Thu, 12 Nov 2026 16:40:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXqq-0000000Ae2F-2ybc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 16:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NPENMsmu3+BS94VMSAUvkedwRU3NJYclxTKT7IXQmWU=; b=EF/p6PI8vHHZq4Q1PQzCrE0raZ
	j5bic/VUAkw8PiANtaVhWuK1DSoiZNqYQncV0xKwJPLg4IXzm1E0etIU++hP0sW7OQnu9Sh6YpMYj
	BH5zHmi4J2cLcZZXXgG+zdzkk5JGsDTuAaiV+vHLfTiLExWhAWxq/nAACZhZpkUvW1NlCgtdGQf9/
	a8n8fskSjcaUFGikxRmfu3TEiFV+ZWnE9YoGIZdFSf98oYfWjn4COJDEDnVHcALsaktdUeFGX4kX2
	mPEE81Q4rG0LBALzSKc3FfQtNsuMkGePM3FXfywRmHu5n7D8AHFJQ+VO+ws1V/L0KyFWxXkUDp8SH
	hoE1tK9g==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXqn-0000000AZGg-3U3l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 16:40:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 933304E41593;
	Thu, 12 Nov 2026 16:40:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49C59601AD;
	Thu, 12 Nov 2026 16:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A833611BC069D;
	Thu, 12 Nov 2026 17:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794501627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NPENMsmu3+BS94VMSAUvkedwRU3NJYclxTKT7IXQmWU=;
	b=blM14kIwqeQ+LdPhURV+QXNd9dZpWq5sYV4WTJ87Eu5fTOxUa5YrWkpHu6Ev2On3EhCpYs
	a6QQSQ6U3HCTAOPcam5BeVKyeQWnOY812CEvxa9fuh/D0WKFpww623wzgt5Tehs2c/k6NW
	xyXIDhVVkuRJAva6HSB6jdYXtvgLcxnSLFOmOxy2J+TMSGw0167tKKVH5Dv6CcFd7l7hJC
	SsUw5YK+1pMes0fopVmk0rQxmX/khrgmE/tLc63Sm+CFM391EZh/0lOMDiz25cq7c9Qa1y
	jk/1HZAI7H2UWASETSrz3GCkHqo9Rl1lnxV8yZf7LxN9LviYMtjPdNwSEPEaCw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
Subject: Re: (subset) [PATCH v11 0/7] Add support for i.MX94 DCIF
Message-Id: <179450161929.2117501.14949541716164131629.b4-ty@b4>
Date: Thu, 12 Nov 2026 17:40:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_164037_779527_04EDA3F1 
X-CRM114-Status: GOOD (  10.82  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 10 Nov 2026 14:27:40 +0000, Laurentiu Palcu wrote:
> This patch-set adds support for the i.MX94 Display Control Interface.
> 
> Also, included in the patch-set are patches that the DCIF driver depends on
> for functioning properly:
>  * 1/7 - 2/7 : add support for i.MX94 to fsl-ldb driver;
> 
> Thanks,
> Laurentiu
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
      commit: 35d189bdab8542d8eaecee4a39e15c1eb737f558
[2/7] drm/bridge: fsl-ldb: Add support for i.MX94
      commit: 7678b7f2d38b5575981b1a7c09139a4660b66826

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



