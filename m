Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 18:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=omqWL6+p;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MuMFYA2z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l52lI99/u0xLVXzwr8zRMu9sPhDs2lTdZmlj21zNAjs=; b=omqWL6+pEb9/ew
	mPhp9/Vz+ois20aq2wSitw8JeW8B8kb4JPz5v8S0639TcPg8zE+ZQSx/33yjRDOkyOB0PKW8yvnGL
	TozuNRFafnLG5M24Hmq36yWci7t7Pw5y/MAMhuiAntZQyGF0aQd88x/D0Z1XxOZ1eznIgQWgmIgDx
	y5y3MaW+z4S+9m1ZAY1kFA4xyax68oK0gd/FXUiJNBRVBbA62RqxTL5NiJH73Vcs8RvxRMZqHBBTf
	YUfEa2QtWVtAHKlHuGz/BuYsBzozExZrw0P4YwgFaenn2EjZfXsoHxRHIEg5zfBV+zbvYHGXp4XOb
	uKLxdMP4xhile1DIwl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSedQ-00000000JOE-185f;
	Sun, 15 Nov 2026 18:07:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSedP-00000000JO3-2alz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 18:07:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AAEC8623D1;
	Sun, 15 Nov 2026 18:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7851F000C4;
	Sun, 15 Nov 2026 18:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794766042;
	bh=l52lI99/u0xLVXzwr8zRMu9sPhDs2lTdZmlj21zNAjs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=MuMFYA2z1Y2oba2gPNcM+zLsP2IUACKuanMnCLrN260zUZnESn85Z40vT22j5b6xc
	 nACu68Pg8AhhMNoGRfXFwas+reHN1Du6ib6Z65hBpGbcxZtmh5bidPRyscMphxzlZW
	 AGh4J54081G2eEjo2ipnC2lgl2r3B6kUk1jxu0o4UV3Ok/WoQnvgF3eVIZbmv8N1hz
	 rgoZHTrsi5C7Cb55VBnya2/jWTEgAkIFz6hxwn73bycIF8eme6s5qX9NOVIFXZmuSJ
	 KWI9n8zW9uiKC34D028T69IuZDbFO7lmzrdOapo1eVAn/sPIRzTpHAccn5SEHCru9Q
	 9U1t+wfcHbieA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 21FCA33BA091;
	Sun, 15 Nov 2026 18:06:15 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion
 control
From: Mark Brown <broonie@kernel.org>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
In-Reply-To: <20261103133935.2892210-1-romain.tisserand@gmail.com>
References: <20261103133935.2892210-1-romain.tisserand@gmail.com>
Date: Sun, 15 Nov 2026 18:06:13 +0000
Message-Id: <179476597358.140154.17606905713832103924.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JgOmomTwucmHGBaErYnCPL+02hVS1hGD2s2sgscCOI4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+fpl+JKtdsfh+mP0xrYU1ff+61NW5mvkvzQozvvjmy
 EOJi1L6HaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhI01dGhluTWo2fXDxisKTV
 +OyTR3nfn1p2PN7zZdfql3z3XHKfL2Zk+O+vdl7807Rn4pYhl17yLZb0npt7UaKl/XvrNNupt5Z
 w9jIBAA==
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
> feed the inverted left output to the right one and the inverted right
> output to the left one ("Left HPOUT Negative To Right HPOUT Mute" and
> the reverse in the A23 and A33 user manuals and the V3s datasheet; 0 =
> mute, the reset value). The driver defines them but nothing can set
> them.
> 
> They are needed when a mono speaker amplifier is bridged across HPL and
> HPR, as on the PocketGo S30 (A33): with the same signal on both outputs
> the speaker gets almost nothing. With a mono mix on both DACs and the
> inverted left added to the right output, HPL - HPR carries the signal.
> 
> Expose them as one enum, "Off", "Left to Right" or "Right to Left", so
> that the two outputs are never fed with each other at the same time. It
> defaults to "Off" (both muted), so nothing changes for existing boards.

What about the configuration with both set simultaneously, so HPL = L-R
and HPR = R-L - that's fairly standard with an actual mono signal (ie,
one channel as opposed to two copies of the mono signal), doubling the
signal over the speaker?

-- 
Mark Brown <broonie@kernel.org>

