Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8AC606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HjBwAWEt;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=chmphiGd;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0hsfnHAH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ho+Xd5M3MLddX0wCUHHcPTNzdHoU5y2P2QioqmPkh7Q=; b=HjBwAWEt1ljWsVuwn5B6S2yuVJ
	+g8VzKXTxTG9HeU1WrqeFWNbOGZsZwwsDrwDxjW1ORd3XnTXF3THCRyPh+uUxula9NC/8hbiD2IV8
	yrHEszgOFuzMrPynA2TgS9YjNKqNgn9BYS59Cd9VV6RjN0k7cIwEUkgBvVAiCa3HK6S8XeUywg1Lh
	K+z4QQh2ATRWR12zZg6ASiLimoOruyMv8S+9iYirMVaxR8kPKiQjAqlXZlCiCIynE2hC+AqPjSEH1
	fjermYc6o0gPYuSwHSZj8gD2E0Wmf8vN7xOBjxzsapbScB5hafm51dU35wphSp1V7/bDTTj0DJvLF
	QUIEAyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS44p-0000000F9HZ-1Xup;
	Sat, 14 Nov 2026 03:05:15 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS44k-0000000F9GT-2fh6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:05:13 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 5A2FE1381A1A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 22:05:09 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 13 Nov 2026 22:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1794625509; x=1794632709; bh=ho+Xd5M3ML
	ddX0wCUHHcPTNzdHoU5y2P2QioqmPkh7Q=; b=chmphiGd2w/jmFcAHc3fc6rk+F
	bwxAvDx9TKZA7IT5uwQtXpttn7z7DVJBMS0dhvfNaMP3KQO3XuJtnoKRps3lk8cO
	LmttOWiTUTLl2tjLOGixxu3bUb1mY8lPaum6dV9tZLzIzv24jZKcLVQIVNFwRfA/
	a6jGs4VT6w9v3swt3DEgaydnFe5WklBqd7Yasm+8MMB1/ShtLOpX2NKh3PPkgg4t
	rNsu8W39rKCjrwW/m/69sNYqtJwV4a61nt3L+wLQhTJGhadxCPsXZTuipbameLie
	4AGlBn+dvCJ47fE72NeU2FXFhcYiXEIkDGEVbaZmYKA0C09oOLBs5xyjtPBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794625509; x=1794632709; bh=ho+Xd5M3MLddX0wCUHHcPTNzdHoU5y2P2Qi
	oqmPkh7Q=; b=0hsfnHAHcLXU1QlNCUZUerfsdF5P+76hk1rbWFigAbYH0EKhR6X
	Y/bFbjcLXrvKFlLlgqhB6/J1QLRTj1I8O7a2GuyhOLoRuwTx8PZYtzcEdhTnWS1d
	k67qxBJEeWrQLnPd58QDQfTqanfA38F7dqG0jrEYNrwLHZG2Uh7jpQhW9DYJ1ArP
	/037unhI2Grxsr66JWruWwEcH11kbvRdCVSC3zHBE16Ekc+Ps9EEQdw1wIyUHJfD
	Ig27fmKDSvDsh6YUjHzHlfwkvyNPyB8KzJrNLSeBbtMePcH7avGLRItyzrhWr9yR
	N/8wtxxWwQIIYCW8uni09+kFu7OIURzyT0Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625509; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:Kh0nvzV1yDUqqL+40ZGJSnalDAv0ay1tetcQGGzNladuHYW
	m5MV9HrBbsRXNAEnRccbyHCOJE1ryXqKO3d6I4K/JfmMAJywPC9UOv51PaBu/6CB
	3jApZBY92iFpiio9/1LwiBUhEkMx8iyQRW6j+WvhJ4KGN2lNXcvDovFtwD19I1dK
	/gECNcllycC4maJr7yUTPZw7OqK/Ll0g43ZXYWLbv5fZETsJHBYjLBwm2o7s1RIe
	jfg5EaejAxbJs13SrdYUf4nkXQNjfOAybSdblWj4hIUzIjCDwudrPS0AwzBUHcDo
	zhr/TeZyL12OaJaua8pTRNSZ8RB5HMj7AGtlXqQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:zMNj118Rl8rR+gwXIlnuBWnpyerlZLoztdEwTTKxavA=:zP8NGW8sziDBFTn5S18gCH5sO+fygkTvKfZ9mQamyRI=;
X-ME-Sender: <xms:5M_3avvqnYai2NEbloT90WOolawWpyHWQTDj58JwE9cboZjz00qDAg>
    <xme:5M_3amDucS_sQyOT57Pdr-qkCmL3U5QT766-WQf2fSEzOaOo3eyzLtitrQO8lmqlW
    2At9G99M212KVBWDZ9BGlNf9PxJn2RFJI4ndl-qJPc7_CJaXBlv_uU3>
X-ME-Received: <xmr:5M_3asVGfqQWo9zr3jAMIppuaTX0gKrNWrAa4ojY7WcmufUhWRe0wfo4Oai7_6Y5qUW9Yd73>
X-ME-Proxy-Cause: dmFkZTFwQh0ELJpE6112s8MyRWshLM3h/+unzmFMo3mwTz5nZkBeMQm0HKaSVwMr5DQl8i
    cnVbEPsE00HX2qkiRUfUrcn3ir9I7B2BH3l1asXz4XB5Ihe8Yi7+6HrFGUUbGaDao+m4Om
    Tota3AHf1W4XjVrWufU7/BBsqAvi6QvWP4UBYXR8PYArHIS3AC4VgAfu3vXuyMfQxlKUuu
    ItVtx8Fb+ewAAONKPHvpvNnEs1QRBpp4uESng/ED1OHfyWKT+dQTir24TDL64AGWxvfdqv
    woA8nt3G/MJPF0+bhvrZpDATkQXockdH2DB44KlDPvz4/0semGzD7o04zs2S5L5hfHC1t2
    5nBGNkvpDR1fqtlYRBdFMhHGHz1lattA5aQ3bdSnaapZF+PsxJjXj/EfUTYlEHpGALLzt/
    t2XOR1rRJRabAEyDA9EZ23HxMrW924dc9mDsaBGCmkRR3ONFVelAVaybSiw2/2HdtWQMgs
    0arDPtmXZJ+FPGUzlHVqGNaVjK+IIVRBQvQqfRzTOX7UrmTafFMFsbJGzoUwxoDxAhg3re
    RQ+tiZD+QFxdLCrB9iQRxm7cxZCN6yz6Cnprk7hfu7qn54+mGKWRTl3YVaoPOC3NLrOLQb
    piEYr+t5ekaInd9k4GYsIYzaAHEMyPnAM6/sNJULkMrZRdCG079nSytl7kZQ
X-ME-Proxy: <xmx:5M_3avFde3C6VhA1XP7NTz9qTjwqS7DxwNDfe4xkbsNMuJTHSYs1Sw>
    <xmx:5M_3anOhFckzaHS55yU0nrQn6Rbtl5VkRd-Uyd0qM2-Tj73vDs8cxw>
    <xmx:5M_3arVbrW4HEVG44FqTSnOWhaulIJfiH3wOQe8ACQO_QoSINhsYdg>
    <xmx:5M_3auznDzH6TLevsWLbHT7DR96qWybOm1FywEpGJcW7WiPm9l1PLA>
    <xmx:5c_3at3XiXCcCoS_mIvN9ggNR638ejcC9jscmMkPis_i9ZlnwUL5cLc4>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:05:04 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: ulf.hansson@oss.qualcomm.com,
	ulfh@kernel.org,
	heiko@sntech.de
Cc: finley.xiao@rock-chips.com,
	shawn.lin@rock-chips.com,
	sebastian.reichel@collabora.com,
	vlwwwwww@gmail.com,
	leonard@lausen.nl,
	abel.vesa@oss.qualcomm.com,
	tomeu@tomeuvizoso.net,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 0/3] pmdomain: rockchip: RK3576 NPU domain supply and settle delay
Date: Sat, 14 Nov 2026 16:04:58 +1300
Message-ID: <cover.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_190510_939768_45C8C42A 
X-CRM114-Status: GOOD (  11.32  )
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

This series fixes how the Rockchip power-domain driver initializes
domains that need a regulator, adds proper regulator handling for the
RK3576 NPU power domain, and adds a settle wait after power-on for some
RK3576 power domains.

These are the pmdomain patches of the RK3576 NPU series, split out and
rebased on Ulf's next, as Ulf asked after dropping v15 7, 9 and 10:
https://lore.kernel.org/all/CAPx+jO-KKvgRS0br-3QGh6Jt4efWJ+A6YoRZKFV_bcfB+8sm6w@mail.gmail.com/

The accel/rocket and DT patches follow as their own v17:
https://lore.kernel.org/all/cover.1794615324.git.gahing@gahingwoo.com/

Based on: Ulf's next (844a13010b0b)

Changes in v17:

- Reorganized the series as Ulf asked, and split the fix for regulator
  domain initialization from the RK3576 NPU regulator handling.
- Following Finley Xiao's (Rockchip) review of v16, the RK3576 delay is
  now 15 us on NPUTOP and VOP only.
- Fixed the subdomains of a regulator domain being left in the wrong
  state at probe, reported by Vladimir Bely (1/3).
- The RK3576 NPU power domain uses DOMAIN_RK3576_R, the same macro
  Leonard Lausen's GPU patch added (2/3).

Testing:

Tested on a Radxa ROCK 4D, with these patches and the rest of v17
backported to Armbian's 7.3 kernel:

- With the NPU disabled in the DT, NPUTOP, NPU0 and NPU1 are switched
  off and idled at probe on every boot (16 boots). Without 1/3, all 14
  boots left them on, and one of them hung.
- With the NPU enabled, 30 NPU power-ups after a warm reboot and 30
  after a cold power-on, with identical output and no SError.

Logs: https://github.com/gahingwoo/linux-rk3576-npu/tree/main/board-logs

Tag changes:

- 3/3 changes the delay values of the v16 patch and is organized
  differently, so I've dropped Abel's and Heiko's Reviewed-by. Abel,
  Heiko, could you take another look?

Jiaxing Hu (3):
  pmdomain: rockchip: switch off the subdomains of a regulator domain at
    probe
  pmdomain: rockchip: manage the RK3576 NPU domain supply
  pmdomain: rockchip: settle RK3576 NPUTOP and VOP after power-on

 drivers/pmdomain/rockchip/pm-domains.c | 115 ++++++++++++++++++++++++---------
 1 file changed, 85 insertions(+), 30 deletions(-)


base-commit: 844a13010b0b93f8561ef2c088f843647d5e552d
-- 
2.43.0


