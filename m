Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5F0606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 23:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SUJYjYf3;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=UlYMm/Fs;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Kbv6hEsY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/o9hLhdBPn8cdi1Wxj/gbuT8hiPvUs8r+uSoRMeCvTs=; b=SUJYjYf3tQHDTq
	ukUgq7FCIhU8U4fBN6AXD+9HLqIq2StVJh0cabpwoKM8hwxQipBXlbE3Q2U4qKgtWFAR+HBG3Crhf
	RVVreXipEQ3MpIF4sIbBit+V8CxNN2CDzfroS8y+InTcWD/f6IudmN4nLNGAtBFI01wE30rVLUQRW
	+766ujA/2Dan7dJ+lqYAf6e+FBin/ODeeI9/vQ7tHcysUQsrRT0F9p+gl+iqc88db4BOuwkjlOuxE
	q7CIeop0viCBkJG86UNIuH8RsRRUcXpSXx2UCpY8Z4wbImiw2kRuSoipY6esPQDZEJJNEwhU51iKe
	eSpIduqR2OpopUl/M1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS11K-0000000EpOK-0LNw;
	Fri, 13 Nov 2026 23:49:26 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS11G-0000000EpNS-1rLm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 23:49:24 +0000
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id C5CBF1302B4C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:49:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 13 Nov 2026 18:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794613754; x=
	1794620954; bh=/o9hLhdBPn8cdi1Wxj/gbuT8hiPvUs8r+uSoRMeCvTs=; b=U
	lYMm/Fsoj+r8geFJv0LOqWv1MpvzDQTc1MqmCUAl2LOGZIHC+Fga3cCXVyeFtSdi
	bYjE3RRDqE7efhzw+hiZSEilb81PpG7/2T9R3Zk37AGE4Hrls18xn/8YeiPNWu4U
	9xPCHeGgFAo2VzfFgRTP9ceWNVQ2Oird/Uxb6lhpS1D3heWSqh2n8q2rRQW5Nxvf
	xycvQaRXjpLgfTuDcpzOlJohY2tnltTfuACTl2+DYLbTLLZhlfNWwYKEky0LwqoU
	meWzhpnk/bJtdWa5UahJFchqCoqMkVerMfrqjQkXXULGBwwIHEi9cT2ureGZT7nI
	tNWu4xIgjs3qO7CKUGW2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794613754; x=1794620954; bh=/
	o9hLhdBPn8cdi1Wxj/gbuT8hiPvUs8r+uSoRMeCvTs=; b=Kbv6hEsYJB/5FYcc7
	o+36gAzaudVzx1OVRXQcOZFWXZBDdr+FPlNt6B0CDEA9xnCwFir29Kl1Ux08ZsSR
	OJyOUuSwPuRI/9+aHkK5MSMww3iWR1ZbiucID2mbzK8Krs0bujCxmr0jTUFHTMyU
	O8pb35YSxRMbHERZ9H6tlwl3uE77gYJ2uaTRT6Pelqmj9bHXhuu32FXG8pKlr6KD
	hmXUquJRZ0ON4uHFQSEMHVM/Xxr/XR9Shvh2Adj1TkVg1zJ+RhEwBW5vs6tnRClP
	TqwEXmBCC16/t+Te8cAx49AP7Kykb7kjG57CtFSbvbVUCHCT9pyqDi0WEg9Kpa9O
	xldsQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794613754; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:g31SflMa37mXgtigdbTyCUT7hzLUGok4FGgQtMBg1QtWKmO
	gXCzckjdF3KtgzsjwPrJkW2AjIusbmpKaaJO8U2R3w4UxjOtpb7oeFbHH6MvQaib
	1DAf7eTLjlfYQlOg+6z8G0oMDRLDyvCair12lJRanK/MyxUUx+jjxwCaHX3Be6E+
	COYpaihIbwCmEbUiSuZHfI7pjtxktqnxrktymk+6T6JDXJPlSP7IicU1KwZgruBe
	kLEAZy3mapIGbbmvr2YlPTDfOlJ7kJSsAI5P3hEQcc8Vd6j5PdB9zs5XfxF5iTTe
	t5KXM3loW5v/Aa7ug4PNrSglmXHI9SsWNbP74vA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:rp3Is3ckG8hz2zrJbdiFe7omtKF0PxAQ8ym9SeM2Qzk=:/o9hLhdBPn8cdi1Wxj/gbuT8hiPvUs8r+uSoRMeCvTs=;
X-ME-Sender: <xms:-KH3aueYucPAN-8SqiNgFZCNiCj6jx5DIKLhFukwwra09vGDSsTtkA>
    <xme:-KH3aujswu_X8kk2LnjSP1Rq4X9Bgm0wL3l-5Wb4hdXJQ_VYYgQBt5AgmSzOa26rZ
    -gJccF6ImqI16DTFxBjYnyd1Y38UvBpjWdPmoqxocMekqfNYlUDwso>
X-ME-Received: <xmr:-KH3aljEQ776igM0Rpj4R0m8h3YUEEhmdoGNKafcAUp2sXlDAVMT4iGZ7QoFCQPtkDrYFpxX>
X-ME-Proxy-Cause: dmFkZTFS60ybEwlxxb4K3SeK8mTCMIe/J7SGIQZYhTY37qjBx5CZtBVvuXRCD//zEzv8CQ
    +kZsvg7kGYLuSkWXyPscs4Ic9CYpH9tvjtBM/I3P0n0odWrIB0N3f9wNlXf7iY84Vr0wuN
    /OkvJ5GwImBrRKfcXCNhp41KWqX6wlztjkqyXvwGNiLchaun23so7vCnQJb45q4NPV2bar
    JSd3SPHKZp5+r50cI5C2Cnupo9v8z4qiDDMnjpwrZNthjLhcTTntOPyEaEv5uflorcthJq
    hHEEH5C78LNxi1tFpExUwGX5Qn5V6TTB4Q0mhCZEyd9xxCMFb62EO4KC/k2ENcFelMvrN2
    batNi9or+TWUf/rgJ2hnMVW64QlO8XsLqhEiN8OnVQWrZgRCQvaBXHppTLxuixNARxd8fH
    QtsTWKUrgWPWy2/x8+UTito3XyVIfiE+4zESbSse8qb3T8LtWM9SvrQ7lG9l3N9ZNL0sSl
    TgQ+AuWkeUyWGG/L40JLFb5Ptb0qcmvRfo75jmDFd3/l5Hh7gtSCRyY5v+5+Pcw0fAiQiG
    l6dVQsY6ZST7H6Piukjbld0gDmFHnzTldJ2I2s9WAt8RLfj+fI4o4Cz2BG7GTW/LZ4DNrV
    mGb6D7byXBAWuQggjbgK5xuPQq98govt++BwmseJ7y/H/df5/jYs4MsJ0xHA
X-ME-Proxy: <xmx:-KH3apRKXpXdx17IJ6LDSkjaUAobNZ0-oiERE7FhaBarxZs6vSVRwA>
    <xmx:-KH3ahRO96YCYAifWNHsqwZxtzY84BbMH0F9X3v1M4WVbJsL6cQVLA>
    <xmx:-KH3alBv0zVEUAKvADA03bTmhMmVEXZGTond7zy3ueTflcI2-ytWcg>
    <xmx:-KH3alzxDNwuPQJYtUbeM31NmEU7iFJzQ5-WRY6qlRJUfZfivAN2Mg>
    <xmx:-qH3as7O6p0S5CopMVSKIooPCpr92uJ29WmqYO-U8LVMRBp7Jfejl2_i>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 18:49:02 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: vlwwwwww@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	heiko@sntech.de,
	finley.xiao@rock-chips.com,
	tomeu@tomeuvizoso.net,
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
Cc: shawn.lin@rock-chips.com,
	royalnet026@gmail.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
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
Subject: Re: [PATCH v16 09/16] pmdomain: rockchip: add optional per-domain power-on settle delay
Date: Sat, 14 Nov 2026 12:48:59 +1300
Message-ID: <20261113234859.658218-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113132323.159015-1-vlwwwwww@gmail.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com> <20261108065917.135194-10-gahing@gahingwoo.com> <20261113132323.159015-1-vlwwwwww@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_154922_649035_6D64DCEB 
X-CRM114-Status: UNSURE (   9.92  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vladimir,

Thanks for pointing this out. Your analysis is right, and I have
reproduced it on a ROCK 4D.

The problem is that a power domain marked need_regulator is switched off
as soon as add_one_domain() adds it, and its subdomains are added only
after that.

NPUTOP, NPU0 and NPU1, which U-Boot left on, are neither idled nor really
powered off, but genpd treats them as off. So when the regulator core
disables vdd_npu_s0 because it has no users, the system hangs.

I reproduced it on the ROCK 4D with a DT that has the NPU disabled. All
14 boots showed the same wrong state (0x214 = 0x23e, 0x110 = 0x13e1),
and 1 of them hung. The ROCK 4D hangs less often than your R76S, but the
underlying state is the same.

The fix: when the power domains are added, a domain that needs a
regulator and all of its subdomains are marked as off from the start.
Once the whole subtree has been added, the domains are switched off in
order, from the leaves up to the root.

With the fix, all 10 boots showed the correct state (0x214 = 0x3fe) and
none hung. I also tested it on the board with the NPU enabled, and all
30 power-ups were fine.

If you have time, could you test the patch on the R76S as well? 10 boots
are enough, without any workaround. That would show whether the fix
works on your board.

Patch:
https://github.com/gahingwoo/build/blob/rk3576-pmdomain-probe-off/patch/kernel/archive/rockchip64-7.3/rk3576-pmdomain-power-off-npu-subtree-at-probe.patch

Thanks again, this really helped find the root cause.

Jiaxing

