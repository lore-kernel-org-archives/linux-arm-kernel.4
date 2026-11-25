Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F25E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 02:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GCmprpTw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5HgyuRLaiTpwVa9WrWOYRJFZwaeKoa/DfbU5t+YXZ9M=; b=GCmprpTwTiSbkGnXM75HPeMsxY
	UM3ObQKBEpkGldGv8ntocI7fBvH2IPGmWMgGZQProA7QMwIO0X8me7vAio6UcsMRv5OF6DJrpSyMp
	sJApf02aas2cyOjDdyH6OYEMPhl+ojH2mSLvPNz8LuSfdpGaupI9UvkU+3HgnRoV4hKmAOuP4/clJ
	Kyz4S6vwmQV92Y732xgx89tLv12QLoZKeh/q4NpICQMPPA4/JmknG2e3LfambcqF2wwexPc3T0E1X
	JlDHLjBc/9BMa2HtT5BWKneKtnbrUj+cnAgZK03Lt8W7GQA/H/8ENKYATl5gkfPtDe5qehe9y08AG
	f31sIBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3E3-00000008GTE-0xMI;
	Wed, 25 Nov 2026 02:59:15 +0000
Received: from cyan.elm.relay.mailchannels.net ([23.83.212.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3Dx-00000008GQH-2Czq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 02:59:10 +0000
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B717E42106;
	Wed, 25 Nov 2026 02:59:08 +0000 (UTC)
Received: from cpanel-010-lon.hostingww.com (100-96-5-164.trex-nlb.outbound.svc.cluster.local [100.96.5.164])
	(Authenticated sender: instrampxe0y3a)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7C298423F1;
	Wed, 25 Nov 2026 02:59:07 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|brad@sim.vu
X-MC-Relay: Neutral
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|brad@sim.vu
X-MailChannels-Auth-Id: instrampxe0y3a
X-Tasty-Society: 72143cdc78417759_1795575548652_4245223339
X-MC-Loop-Signature: 1795575548652:3151998745
X-MC-Ingress-Time: 1795575548652
Received: from cpanel-010-lon.hostingww.com (cpanel-010-lon.hostingww.com
 [18.130.191.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.5.164 (trex/8.0.2);
	Wed, 25 Nov 2026 02:59:08 +0000
Received: from 162-195-230-196.lightspeed.wchtks.sbcglobal.net ([162.195.230.196]:59026 helo=epyc.attlocal.net)
	by cpanel-010-lon.hostingww.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <brad@sim.vu>)
	id 1xW3Dr-0000000BJlE-3Kyl;
	Wed, 25 Nov 2026 02:59:04 +0000
From: Brad Hawthorne <brad@sim.vu>
To: linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	linusw@kernel.org,
	arnd@arndb.de,
	envzhu@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: v7m: reset loader-set CONTROL and M33 ACTLR at boot
Date: Tue, 24 Nov 2026 20:58:50 -0600
Message-ID: <20261125025852.1160075-1-brad@sim.vu>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: brad@sim.vu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_185909_638081_7EC691DD 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes to __v7m_setup for state a boot loader can leave behind.
Both came up while bringing Linux up on an RP2350 (Cortex-M33), booted
from a Raspberry Pi pico-sdk loader; it is the board I tested the
deprecation series on.

Patch 1 affects any v7-M or v8-M kernel whose loader ran an FP
instruction, and reproduces under QEMU (mps2-an505). Patch 2 affects a
Cortex-M33 kernel built without CONFIG_ARM_MPU whose loader set
ACTLR.EXTEXCLALL, which the pico-sdk does by default; it is tested on
the RP2350, as QEMU does not model ACTLR.

I know the Cortex-M platforms are going in 7.5. These are for the
stable kernels that still carry them, and for the v8-M core while its
future is discussed.

These patches were written with an AI coding assistant (Claude Opus
5.5, Anthropic), as each patch says; I reviewed the reasoning and the
test results.

Brad Hawthorne (2):
  ARM: v7m: clear CONTROL.FPCA before the boot SVC
  ARM: v7m: clear the Cortex-M33's ACTLR.EXTEXCLALL at boot

 arch/arm/include/asm/v7m.h |  3 +++
 arch/arm/mm/proc-v7m.S     | 17 ++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0


