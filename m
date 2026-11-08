Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23831606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QVUba7/p;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=T+KaQRey;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OuEGEdxz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7r/PwOZ5Pf0uzaRyPIbMznuBoyLrmINqOVvG3RmngNc=; b=QVUba7/pkgxinV
	j1qQqBAMniDezGYbWBaGkFcdI0wV/0mW/knNzl+FvJf4mvGdUqzVB9AjReRgIF2XHIIxMJ3rA27EC
	8X9fOe+n54BJEiUuwu6V00d/Onn2THs4oNNl3KstmCXZu55rfBHv+tVdbQ8Iz0BgSXYCfBctz6QPa
	XJ3MWoqqcrUykP6HCLmqBpwc0gRNV06tLBspzo2HkMywdA3NHOgDB3ChwH1ply2YXQXzANo3hrgMJ
	QZwRBcq3bOxJZyDmeOXheqPhoVZkfjzssZ3xr+ay7u4v5e0AMrvo1pNWUg5XZ7/g3jHhhydJsUTac
	v3hbIedQTnx9ebZ4Sq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwx5-0000000Floo-3L3L;
	Sun, 08 Nov 2026 07:04:31 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwx0-0000000Flkb-3W7V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 07:04:28 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 49FB41D0017C
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 02:04:26 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 08 Nov 2026 02:04:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794121461; x=
	1794207861; bh=7r/PwOZ5Pf0uzaRyPIbMznuBoyLrmINqOVvG3RmngNc=; b=T
	+KaQReyzzYjQP+htiwkooZQkJGrs577QZLRdMoRxTb+DcDeDAQyOha7ddizh/Veb
	nAmkabD72MCShBF06r+tRjaIP35YPO+ADbPs78VUNXwzn6kQFZyF4M2BJRqS0y+T
	aRg8miEv/OuOaxlLplsPmhhGokaaZe4La4T2ZHZR2HUoypV5+Uq/6hYAtkZ0ha7v
	/KKRcE+yEXcllrf9EVBZHV+HLUz9kDiUtVLqRDMq4uiCNYD6PBLPDvOwhctU6UwY
	PoMqJeUcS6ScafTA5dhpq5acuk/CqfCbEHZ9aRRuvhnxSe3S95oS9Q3vYYhV3E2Y
	2ZDMPpIdw40/4P+ZKrvbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794121461; x=1794207861; bh=7
	r/PwOZ5Pf0uzaRyPIbMznuBoyLrmINqOVvG3RmngNc=; b=OuEGEdxz7eqYtKpNX
	ftMIXlrX7x+RiQfYy/YLuT+RowWErgdXrXfuBKygIBE4wBJqjhdeWu/6a5mE2JuV
	IrmEHIGQT1zOtNUdk7hse1e/m9wbH4EicwCcHzGYre+rX7A5GMHK8nBM9uUs1neS
	CSGVLXP5wRKK2wd/lgcuxGFbFMn9DridOhCkgCj0qa5cCwCm3Nj3Ed/AeLz7HbC/
	ft84m9sMja8wi7iatlF9EjURYU7roMvTgrQW8L7rbLdHq8x8h3x8x/lYsFX/xYmb
	OHcgfz98naA7LoYY82mSPN55mJKXrGBSTvbLHCigGVUefQW73Nb+PwYsuTaRPMYY
	Rh8OA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794121461; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:RGb2OjCrPHtOjs4qoKKo9F6O7zxbaeibFM4MyEQM1Q60Nw+
	uwmt56gdXymEvK+XOZOVhVsrVN57RDVfNn1ZIemAV1qSN3tPNgI/ml0KqKYWeAIp
	8KwsC3BW8u6QnlgWV6TJ5CKnOZYrc3tlveJtA7rZFv0Aa7QU2gxxKCoyhUUtcR2K
	zOGEu+3ESCRsw1BFAS2ptPiY/ntFiu2NicarZkk9jMUzUZQGBnnswAmfPcGttNBp
	AiBNOpY3TtJbZxkiAE/0/mQPfpBwiERZ+sodxImBPdF2akTQOf7jYewHsl7+QPqR
	Exek+SUpAgxcmtf87iEWw6IxHEOvsfumh/fRtFA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:46820ibfAwLP77XC8IoBo57A2NjGRQHXMONE8H3p7t0=:7r/PwOZ5Pf0uzaRyPIbMznuBoyLrmINqOVvG3RmngNc=;
X-ME-Sender: <xms:9R7warW_aBtQ5oYDsl2yhWV2q1ejLybMi0tLip9KiqZiMYZ7mTi2aw>
    <xme:9R7wagC_QVxIq8l__Ko7l3mlmB8_9Dq5YNBylvtejLGzsTLzWDlNwd4ufpmfN1j5U
    OWUEvaecBDJmgrtqCM-392f563SDcnApH_ckPvADVfNxdBx1ojaXX73>
X-ME-Received: <xmr:9R7wauqddniTRJCVJSKORveiw2lcpQ-DPZ4yq4uWlpgm9oIeWkdP0aRj3_rCAmA0syx5-N3Y>
X-ME-Proxy-Cause: dmFkZTE5NwZyd+ayTW5ihGeNQbl/O97mnCf1OvUw/2ZR6E1IltWJneehUG6lk211J8bNJD
    GXJcI3YZAXRTrSK5sFTlbLrxzALRC4/6lE7XOctvroRrxMX83re1MlqThq6OcFmRxLDIeg
    dPCIoY08hWRgpTEOmeQAgr6Hi8Hlw66W3366qbyMNTuQvlUyucz9MwwrNSeHDrR4V+rZ6p
    c0CmZtStyiRIxl7LZ2wOt1R6dxPekaPzd2JrKFAURgPeOZIDlHjlK5E6ILvTQRx5g4acrU
    benuNqZX04E55T+WlvMPFZHgoTh9KI7gGDaRJvvN55diSFD3RWkTgRJnSKwwWUx3YOF8MI
    mlM0Mb+S9sikxkM1SmWMu3AfV8neUwrN68FrnpcyLg57ZRbIw4o8oG7BB0Z+PPItlW/ccF
    vIDCMadNqOG6FICc7JJRJiMAG7l2eKFEOo1XlnflshFhIYIhktbQjch7rjC+vf2Tdu2je6
    VEcLBP0K1Jt5/E0s8Fmnvi0AaDr/ur2TS/niWGFXS0vEMh5D7Om9r0fhBqnjaXiBaozDgX
    nwH9XUOajxrr5cBXE6ek49oaVbh4DhRJLDF+4QmtbrzdSHo1kPyNxL6LDeVxtOc0NfwcSc
    QVOaXlt6mULoT9aAb9zV2snHJaxDlOdnC7Af8oAu/mgzzbYvOWsNq3rEsY4g
X-ME-Proxy: <xmx:9R7was2Ubhmtujr67kHdoFipgpbNea6X9kMZKS_pGBV8Rm-dfnFM1g>
    <xmx:9R7wal3upHR_4krVWQP7LKCYdVLmc7TsvWyX2nBSxaDfEDWyHvFSYQ>
    <xmx:9R7wapcCnZI-NIHe9WFcUu_NwfquyqfF4vlHZy4uY4h_YWXp3M1gSA>
    <xmx:9R7wah65Q6cYlvkVBmXXCuv67ZuqMYxTBhwhR4kP8qZRF8fhcgLxTw>
    <xmx:9R7wajVhC7wEjjn-KXdFosYgeezmVww20KXxwvQhRmgJadL3CXAW0MMQ>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 02:04:11 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [PATCH v15 03/15] accel/rocket: wait for a running IRQ handler before resetting a core
Date: Sun,  8 Nov 2026 20:04:07 +1300
Message-ID: <20261108070408.136140-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104125529.3229301-1-tomeu@tomeuvizoso.net>
References: <20261101082307.151957-4-gahing@gahingwoo.com> <20261104125529.3229301-1-tomeu@tomeuvizoso.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_230426_920230_3C37ED8A 
X-CRM114-Status: UNSURE (   8.47  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Tomeu,

The cover letter, commit messages and most of the code comments I sent
were written by an LLM. That's my fault and I take responsibility for it.

For v16, which I'm sending with this mail, I've rewritten the cover
letter, commit messages and comments of the accel/rocket patches myself:
I write them in Chinese first and use an LLM to translate them into
English. I've also removed the long comments the series added. I've read
coding-assistants.rst and generated-content.rst.

On GET_PARAM: I agree to add it. v16 adds it as 13/16, returning a
hardware version enum that matches the NPU DT compatibles. Would it be
fine to start the enum at 1, with RK3588 = 1 and RK3576 = 2, and leave 0
unused?

Thanks,
Jiaxing

