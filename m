Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAD460A3836
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nPLER2nQ;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fHGme+Fe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sSp9BDWg5ZWFhbGy2avp73yaoxaLBJeVqHeVZVAC8aY=; b=nPLER2nQtOGhfr
	+6Fy7+B768mU7UncpE6tJKs98FXiKMlE37O/2wO2wZt+Xm1BYZPNTUIPXWOslwgVTgi3Xn/O7ikw2
	ZgWCuR6dq2l9GIl2zw0bEIANkOcAhD8J1GzM+FuXV9FpHbV/Ak5Ptz/sHrklpFPLOPTmDrvBejJ6L
	AULfbIE64MfSawkeHbQh0GQa5e7ZjM5kFDTspPGF9smjch0f4+1evm74hL8T/+rGXe+vVHE1rLAD4
	2k9JFlyu7p/U3dq7fPNTblBJQScx+KW9KrN+xTHR/6jB1A4wCIt3b//r2RM26pPEyyY+gY+r/uRoT
	TiSr0veNmUr9bL5vgSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5d9-0000000Cn3e-3xvy;
	Thu, 19 Nov 2026 17:09:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5d7-0000000Cn2D-1Rhg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:09:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6901B4E4166D;
	Thu, 19 Nov 2026 17:08:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 331455FF9A;
	Thu, 19 Nov 2026 17:08:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36FBD11BC0CE4;
	Thu, 19 Nov 2026 18:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795108136; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sSp9BDWg5ZWFhbGy2avp73yaoxaLBJeVqHeVZVAC8aY=;
	b=fHGme+FeT4WFj4gL/EBFNAceg+tovjWRrktsMkMdUypxK7Y5Q7hWo94Gbp/y7F378ps56J
	ueaxPgw4CQl+CyVEdpn/jzVPVGrQDD0Sfj5UgkA1K+bRMGhqlkeqNCSrxYTi857zRooHuP
	XyiA/Xw5HQqLUOEUnBMJ+ejOdJ4PYnG9VO+wwj1sAGNIN+VG4imd5KOOKevT4weNepw3ql
	a0aDhOPA1s5cs+S60sZJfEjglMMoKFAHgFuGsTRzf2u22mAAmUSsBAkOzY7Ahb3mr8l3AL
	3yatl9n6UFeUv1dVFv2YythyMCmYdxO0Uk5b7UZW8DWZ+sgSjJDjLuXJZToebA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 18:08:49 +0100
Message-Id: <DMZCQ276BVDA.2K9ZE12X5VF97@bootlin.com>
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Hermes Wu"
 <hermes.wu@ite.com.tw>, "Allen Chen" <allen.chen@ite.com.tw>, "Pin-yen Lin"
 <treapking@chromium.org>, "Chen-Yu Tsai" <wenst@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
To: "Daniel Golle" <daniel@makrotopia.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 06/14] drm/bridge: it6505: bail out of the IRQ
 handler when status reads fail
X-Mailer: aerc 0.22.0
References: <cover.1790552614.git.daniel@makrotopia.org>
 <2e003c2e6fdb56d03c3a6effdf090079afb2ffaf.1790552614.git.daniel@makrotopia.org> <179251509977.78870.3399297204284524303.b4-review@b4> <179481904177.211952.7029866729856302771@makrotopia.org>
In-Reply-To: <179481904177.211952.7029866729856302771@makrotopia.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_090901_519982_1BCA289A 
X-CRM114-Status: GOOD (  20.03  )
X-Spam-Score: -1.8 (-)
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

On Mon Nov 16, 2026 at 9:55 AM CET, Daniel Golle wrote:
> Hi Luca,
>
> On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
>> One first question it whether a read failure is realistic or not, and
>> whether you have experienced it on real hardware.
>
> I have not hit it on hardware. It takes a failing i2c transfer, e.g.
> the chip NACKing while held in reset, which can be provoked through
> the force_power_on_off debugfs knob: it6505_poweroff() only calls
> disable_irq_nosync(), so a running handler keeps reading from a chip
> that is being put into reset.
>
> And hostesly, my interest here is basically getting audio going on
> that Lenovo Ideapad, and for that
>
> https://lore.kernel.org/all/cover.1784561622.git.daniel@makrotopia.org/
>
> is sufficient. The 12 other patches are what Sahsiko has been chasing
> me into, and all the complains it had looked valid and legitimate, so
> I took on writing the fixes for that as well.

Ah, well, I understand.

I had missed the initial history of this series, thanks for the recap!

>> I would consider replacing all the 3 it6505_read() calls with a single
>> regmap_bulk_read(), making error management cleaner.
>>
>> What do you think about this option?
>>
>> Perhaps the three it6505_write() below could also become a bulk write.
>
> Makes sense, INT_STATUS_01..03 are contiguous and the driver already
> uses multi-byte transfers elsewhere. I'll switch to a bulk read and
> write in v9.

Good, thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

