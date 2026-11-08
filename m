Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 06:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IgQlzC7W;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=R2pCNZfs;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BaiwJNkM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5c5YwQfw6glIQ3sp4LG2WJX6kW+CuAO4TASY3DLJo6c=; b=IgQlzC7WNWEhZ+zbW4MPV+6wUo
	h4sxGKwxD402qkuZsX73sxO6GS2FJgzj2FsYNGfN/wcFIXfrK5dNB/gN0yD9uzjkwOEXKjbZlyzrm
	IxsIRl/STi12MwDIsmw6uzACeGftUeX5K6FMnYUERb/sd0FBPPEYvbROYAGfbasVqCFyvQCJiRS2f
	vtGzPYdiVOAo5bZmCoUm7dC5xGcI5sjHsGJHakqO+22LCsGEh7p2A7wnSWxhlXQvcSt6JcujFGQB3
	cZ6I9e4tjhv4pSOmrEJJ3XsLCx/rM7OZ1a+fwGk6CE7Aq3GffREvEn2eEvdhUXyy1+ZYBz5OsqNmp
	Doy7rBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwsP-0000000Fj87-1Cvo;
	Sun, 08 Nov 2026 06:59:41 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPwsM-0000000Fj6p-3yV9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 06:59:40 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 39DC07A0115
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 01:59:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 08 Nov 2026 01:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1794121171; x=1794207571; bh=5c5YwQfw6g
	lIQ3sp4LG2WJX6kW+CuAO4TASY3DLJo6c=; b=R2pCNZfsdGPizmH5CFvrMPVhSi
	OAJH4u+rQ0yqv9p2Wtb10U/13JqZ5eHfEorwGfC2TP5FmVf0nPdnHtcyNun3ysvt
	ufyX+AM3FCXyAr2ketrgBeEX0Qzx+sNt/hCclyEjNZCgyLiQNznmBBI+3YbRDbno
	JyPb36dliryUdP4JKJJwLytADlpuTypj+LaXNGKNHcZ9MJ/mzQ4jC4tbd5nW/TNc
	vR8SIhr4MSa7F/AecrkXBnk2ZvzcWefNG2F1QlvRpz5hQR8rxjFpX1WiN5vkLDT9
	hagwji5hLb7FRepYcdp7Rg1r40EiH7Q5hE6tCsgm75hQLBXcuL4NRjgWJcPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794121171; x=1794207571; bh=5c5YwQfw6glIQ3sp4LG2WJX6kW+CuAO4TAS
	Y3DLJo6c=; b=BaiwJNkMLqwzOWQcRZZ7F8J83bvyMzXYj1itNLJhGP6dGbo9VDY
	fLZeL+XvErD1jsMz97S3E8Vsc3MkzgA32Oh2FRvcTgA7rUrs62zkEK6EhrltO8pU
	VH4zdoatvU9MntcNB7v9MODrE7shoTSWG9K95BuAmica6z5kyXvGAZlzG2WECaRp
	vipYBrPTj4UE9uZgEhEjPkmbCS9LUxX8jiYyUFLT6cNv1Fj7mAOBwLHJzxtGOrn9
	jz8mgrf0BT+jU1SIpi6VYqO6GJU3162g0Bgh68h0WA91YhcS1/X+kW25pdtbx/+h
	mDOmyQY2G8whs6UBQJ6mStRI8jMlqEtR7jg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794121171; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:Cd7kej3wxsBDsoceakmBDrrOlsZPnlNcj0k+iqGG4ziXOg7
	AWkACiW5qmMiA0Ni4BmRmuK3UnwadHzE3pSWqMtqsEOY1DKPiPI6qHgEUf8r0ePh
	YSAHshHD25j/FrWbYgN/9UyARw1Mt5VwhcfYNKwpXQ6LmEmfJIpUeVoj1IqnUJYS
	xj4Qy7fHQov5ynUO6v5c+shdoCpGD9LH/B0Z2rWYtZK3axI3o78RSMwEbTz04PET
	FJjfO/MW5ws4Uah1Usjv4jJYz+s9KJHlftZ7iKINc2NB5sPjLJ/jQOTgcVViWfev
	xA8jauBddQ5eQKxZczUrZzq3f6GC6L8wofvlzyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:0Hb6NGQTbSiP6J9K8ROHO2Z8lf23EXIb76JFPze2l+8=:lIARtbVoyFTth3P9LXxTFUZ0gGbe4ogIP4TasWzB74c=;
X-ME-Sender: <xms:0R3wakADAhVpUtvk0PojSS1Fnbs5bIIv-h-f4KepwONWz0JXkGPTWw>
    <xme:0R3wai9jViP-GoO5mFkUCsW0FRJIBf99zjIrOlzqV2HSoIm4pFW9XwZdTzEbocA0-
    Vr1kHxA5kvswsCv-jvvAYC95UbWGG6lbKNwp7caIK6QcN_S277Mu43g>
X-ME-Received: <xmr:0R3wau2_FuWMJ9JmGKBnZLwinNaEct-wyhcsqRHrHQ6jIUjj6HULVeQyJFZ2BKy4e8uQffK9>
X-ME-Proxy-Cause: dmFkZTFWwKTEx2JlF6gbxz/CcZ5fOIEPMTwVUWzP082guo7LQMgK7h789MowHkag1AGdJv
    Qi5S3iCW7IkIlV0pVZbVxPkmE51+n7fGqs28fdNBe7OImR6ZReSfOcge1vefQ2dYIPjd/3
    8oouzHrOzwizmnPo1Jrj2K0Cz6p+y7cnDV1Q7f64sIfTb/RehvLUFbgwKi6YssWkzdFwq6
    PiOomVYP7898vo56/KT6uE/vFspwIACRCqrPnfnGSDvko45DWPmIgV1QsN1iiB6XoRbR5/
    hqF7mdebvlnyTwN4YuJ6h5Db0Q4msVL+t3WXN9SrQ1fzPlgWJWmpS+HhRxJYCi1m+5oETc
    Hf/c0rOLaIGYwsXYUJk9RDSvEHRxWZa5odvrMxGFaVYAzpZ+RJ6pmy7HNp+L6KNMbjZvcs
    5w4IeTnfFHNhPQQDXU6R0fvBgaB8bdUCo2xV+DP47ptSNs2iew7ns9kHjQaMGBcENSDf6/
    1n/tGYGTDpygfLAksUvvLewffFcyx3AiAuqTTRNQpBYBRjpD3ImuWZZwEIJ7NaPqz2Ep0i
    18NtNYfg3+xwDtsI5f84X0HU/kW5w1owhcdQZh5+RAm/sDzXXggz/GJ3dNjWp/b9ew7SN/
    tfKtl6cZGQqJIXK0jvbXvDXh6ES2z+DXksOqFyi8EDmUX3DsGB8IwnAhIF2g
X-ME-Proxy: <xmx:0R3wahTC7yxmYtakbLUznZAn9t9if0Fy93KVG1ar7_RatWT5ahJz_g>
    <xmx:0R3wapj_xiA45HSZ_mXP_UzBWDt_4dsh_9Qnbbrj15vMN_mZ60ub7g>
    <xmx:0R3warZa_YTgKxAvMtBxd5tRo-OKbLO7byRud17rUUgFTasbB4wgfg>
    <xmx:0R3walEYCYjyyHdOG4qxGLNKQPqPju1LTZLedIb1PASn4FGkBN_9wQ>
    <xmx:0x3wak7QszLLyOVvxgx-4hIUGD2clfHh3Rw9oszNcOA9TTF1ZsIPB8xj>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 01:59:19 -0500 (EST)
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
Subject: [PATCH v16 00/16] accel/rocket: RK3576 NPU (RKNN) enablement
Date: Sun,  8 Nov 2026 19:59:01 +1300
Message-ID: <20261108065917.135194-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_225939_177198_1FDBE8CA 
X-CRM114-Status: GOOD (  19.02  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds RK3576 NPU (RKNN) support to the mainline DRM rocket
driver.

Based on: next-20261105

Changes in v16:

- Tomeu: rewrote the descriptions and code comments of the accel/rocket
  patches; I write them in Chinese first and translate them into English
  with an LLM. Added a GET_PARAM ioctl that gives userspace the NPU
  hardware version (13/16). Please check whether the proposed enum values
  are fine (RK3588 = 1, RK3576 = 2).
- Heiko: shortened the commit messages of 1/16 and 3/16 and kept the
  original comment in 3/16; moved to one power domain per core, and cut
  the IOMMU clocks from five to four. The measurements are in 8/16 and
  15/16.
- Chaoyi: removed the unneeded comment in 11/16.
- Sashiko: 4/16 now drops the runtime PM reference after
  rocket_core_reset(), with an A/B test showing that the old order hangs
  the board.

Testing, on a ROCK 4D and an ArmSoM CM5-IO, both running Armbian edge 7.3
with the v16 changes:

- Tested with charsiu (https://github.com/gahingwoo/charsiu), an open
  source LLM inference runtime. It drives the NPU directly through the
  rocket UAPI (/dev/accel), without Mesa or the vendor runtime.
- Llama-3.2-1B (Q4_0), with both NPU cores running together, gives
  correct results.
- Perplexity on the same model and the same text is 41.1009, identical to
  the previous version.
- On the ROCK 4D, tested IOMMU clock combinations; four clocks are needed.
- On the ROCK 4D, repeated resets with a 2 ms job timeout, to compare the
  two orders of dropping the runtime PM reference.

Armbian has merged support based on v14, in armbian/build#11162
and armbian/build#11163.

Known issue: after repeated resets with a 2 ms job timeout, the IOMMU
does not recover ("MMU_DTE_ADDR is not functioning"). I have not looked
into it further.

Tool use:

An LLM helped me read code and technical material and write part of the
implementation. Some of the code in the series was first drafted by an
LLM, and the commit messages and cover letters of earlier versions were
mostly written by an LLM.

I reviewed the generated code and tested the changes on real hardware.
I also used an LLM to write test scripts and to compare register write
traces.

For v16 I rewrote the cover letter, commit messages and code comments
myself in Chinese first and translated them into English with an LLM.

Tag changes:

- Picked up Heiko's Reviewed-by tags from v15.
- 4/16 changed after Heiko's Reviewed-by. Heiko, please confirm whether
  it still applies.
- Igor's Tested-by on 4/16 was given on the earlier code, so I've dropped
  it until it is retested.
- 8/16 has Conor's Acked-by. The clock count changed from five to four;
  Conor, please confirm whether it still applies.

Igor Paunovic (1):
  accel/rocket: request the core clocks by name

Jiaxing Hu (15):
  accel/rocket: take the completion register writes under job_lock
  accel/rocket: wait for a running IRQ handler before resetting a core
  accel/rocket: let the core suspend after a reset
  accel/rocket: factor the completion tail out of the IRQ handler
  dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
  dt-bindings: power: rockchip: allow resets in a power domain node
  dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
  pmdomain: rockchip: add optional per-domain power-on settle delay
  pmdomain: rockchip: cycle an optional power-domain reset on power-on
  accel/rocket: select the per-core clock and reset counts from match
    data
  accel/rocket: add RK3576 NPU (RKNN) support
  accel/rocket: add a GET_PARAM ioctl for the hardware version
  arm64: dts: rockchip: add NPU core domain clocks and resets to rk3576
  arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
  arm64: dts: rockchip: enable the NPU on rk3576-rock-4d

 .../bindings/iommu/rockchip,iommu.yaml        | 26 ++++++
 .../npu/rockchip,rk3588-rknn-core.yaml        | 40 ++++++++-
 .../power/rockchip,power-controller.yaml      |  8 ++
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 22 +++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 82 ++++++++++++++++-
 drivers/accel/rocket/rocket_core.c            | 14 ++-
 drivers/accel/rocket/rocket_core.h            | 10 ++-
 drivers/accel/rocket/rocket_device.c          |  3 +-
 drivers/accel/rocket/rocket_drv.c             | 61 +++++++++++--
 drivers/accel/rocket/rocket_drv.h             |  2 +
 drivers/accel/rocket/rocket_job.c             | 84 ++++++++++++-----
 drivers/pmdomain/rockchip/pm-domains.c        | 89 ++++++++++++++-----
 include/uapi/drm/rocket_accel.h               | 40 +++++++++
 13 files changed, 419 insertions(+), 62 deletions(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0


