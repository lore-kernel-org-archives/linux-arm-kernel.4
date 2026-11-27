Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B154606A324
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1IFkaaSP;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YITMaOzE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K/F58fTzeymXPtAhbnqmB/CVuNXYDU2P7HmmINGKBoo=; b=1IFkaaSPedpMXX
	MVy/t2tdMVZPhsPGihXuih4Mq6zTTAj5O0sGgel4YXW6W7VoIBbiYnWwITTeyvn3kzPO4RluxsdEw
	A13xka8pw+jKli5kR8k8//F8FLtNNSLFH7eC918wSEinGO2y/oOnJglTsBMAxUc8uX0wQrVfmr/52
	zoiemNXYwWHcV08RaVne1bhiJ/jJwLX9kV8xuxLZ4TOX3F9S3lTYBr+i3moHGiWkCQ2McT6UaHMVX
	NtXRKsFzomVzxfm3Mcz7t6a5PD8cd8X31i003lKniNhePKqCIvQxA4JCwm1RFbZaYHgI4ukJwnX2i
	QlToIioHpxtkcc2LFszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxfz-0000000Gj2n-2MYE;
	Fri, 27 Nov 2026 15:15:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxft-0000000Gj1L-1Db8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:15:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3183E4E417C5;
	Fri, 27 Nov 2026 15:15:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E81C86049C;
	Fri, 27 Nov 2026 15:15:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83EF011E90B55;
	Fri, 27 Nov 2026 16:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795792537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/F58fTzeymXPtAhbnqmB/CVuNXYDU2P7HmmINGKBoo=;
	b=YITMaOzEHoFT8Vw3PeTkE4bw3pS1fynbk/EHTRHYCmd2eGK6trTuao71I+BwgclPKtBf2o
	sXhYc+lTt7gkgm0WPbFiSBV3G0Yi0tjt3He5CnRIZzNZmZyaI81slENa8dMNr2AjL5nevD
	C8NRIjLqsiFuBtaDTZxyYTIIu9YQObpVyxiT3YZKPkrVOI5YZDW5mB9CjxsCTITBcTKuz9
	zj62EQanPs5MxrFTpq6InG1/a7X+xnrI936IdtvhfeYKAi6uyRM43waRUE/mI9BMw+KnMv
	j9epb+hFf8w3sljp/duVbQHoFU6i/rULR5AuoYFV6VTl55jUK/wRkxaJBsgJ7Q==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 16:15:28 +0100
Message-Id: <DN63BMGBI07A.1IC73REGZ7NXZ@bootlin.com>
Subject: Re: [PATCH v13 0/5] Add support for i.MX94 DCIF
Cc: <linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Abel Vesa"
 <abelvesa@kernel.org>, "Peng Fan" <peng.fan@nxp.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>, "Jerome
 Brunet" <jbrunet+clk@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <awmGCp4e2pgtxsqr@vm>
In-Reply-To: <awmGCp4e2pgtxsqr@vm>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071545_550671_1D8009E7 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri Nov 27, 2026 at 2:41 PM CET, Laurentiu Palcu wrote:
> Hi Luca, Frank,
>
> All patches in v13 now have review tags. Since we are approaching -rc6,
> would it be possible to pick this up for 7.5?
>
> Luca: could you apply 1/5 and 2/5 to drm-misc-next?

I plan to apply these next week. I ususally leave at least 1w after a patch
is reviewed before applying it, in case someone has objections.

> Frank: could 3/5-5/5 go through i.MX tree?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

