Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC660A2612
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=taujkzHv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXoFDPpI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8hmoKLT1gjOspS10oZh4yk0WUzG+6Ziyq7q+jEx21fM=; b=taujkzHv5q2/rCVWpz4uRgfX5B
	tyIsLAnION0tj8yTjgVyfvNdLlyeWrEBONfLkSJtchmxg/Iw9mr7N2+chXCa++3weRLCzisugI2/n
	B4M4D9fju81WBIOOiOnE1UiWpznJjoL5boUTEF3d34PGfdUwVsI7ij19U7EdFFRMmn9pXBASdlq3s
	1mFypYfmWnAwpkXJSQd6kFvEgMM9VSmIXRAO69LvM6lUOVeOphF09ip9KZbOy7INJPyIfkgMw/+XK
	dUgaLkpFRLKMt+nUX04FNNCarQni2We699JusOg+LCvhWfFCBnNv1H/MiCP12myjsJHSNVgtQ+eUn
	O+ORBaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0X-00000002l6f-1oNn;
	Tue, 10 Nov 2026 07:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg0W-00000002l5e-1BNP;
	Tue, 10 Nov 2026 07:11:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B77BC601C0;
	Tue, 10 Nov 2026 07:11:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294663;
	b=OKQ2kqAxqvKvpAh0XSMep3r0mgGN+vQIZ/+7Q/uYi7YoOEBMbGig2qKPd2z0+aBNRbWk
	 eSSycEtTL6KgiE7CkUkbHbqFBXsJK2iRXU4Z4srn9AEbEIXvrFegd6wRefgokIA7LVDo1
	 ro0FhvcDh2+ajkQFGQOtwamxoI3a9yDiBgTgAkNpGHQxEIbyflCo40+KoiuqWv6CrvQMS
	 FovoRgAd/NuXgLu1I0FkOLIWsSAOft4XoTAX+xUZQbN2qdu4qbfyYuCm2zNscHzr/PCa6
	 3OQrwoy4hPUh4txS6HZDhoeoIfEq64lF9mOUWAriarDsC6YyUy16MtA77xSU88R00wQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294663;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=8hmoKLT1gjOspS10oZh4yk0WUzG+6Ziyq7q+jEx21fM=;
	b=qcyJ12VFxlLzUHQeNtYu2sUpLmLlvOEJ/JqDKe+evTNM8QKt5ZCzBVJ6e1sGLrq2F6Qo
	 5r2lyIL4IBv1/oxladquN6dr3N/8uvPT78Y+ktpyNpTOsL5yzDIj7AdZsxcXx4GsHd8dF
	 4b9cxk9E2y3+sDpwGL3em49AuejZyNDDDLFgmKPrrMzrPppGDq7Hl9DoSscG7RqE+9A2k
	 gpmoQUX2vkl9BoyYjzilLFQWTzX9JCkpGJN+vsSAOLXzUYIA/zsnEGJ8Mx6Zy4GfsQSjn
	 UgGeAPX1R1VdZSXwkQSseC5c953juWRYGfBLjTC2BXJxCvXvrKWsgAUR/0vruNIN26w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA3361F008A1;
	Tue, 10 Nov 2026 07:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294663;
	bh=8hmoKLT1gjOspS10oZh4yk0WUzG+6Ziyq7q+jEx21fM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=MXoFDPpIP/lD4KyMruOXI04ThLwvyDaVVms30KHPiw/FlfP6IVEYWttTQ9Hu2STyt
	 DwjRafEMasSL2VFcvO+Oy6ABuomlfcL0q/gmn7O/j/Wdd7+EHI2VUJWw02LeZYSdzo
	 CKQWXMzDaPVS89d1IzoBWEts1YwSSuAHifwC+qRMxx98rmPyGelifH8b6chWPyfsGH
	 4A1cWWq7DEL81omM/CCykaHTbkhDbqezhI/GkwPR6rPJxdcCphipSJH66JFr0vM2Lp
	 dhY+X5cXZAtxgjsreDeadTyiTT9BVXQZNCvJ0lR1oHDPNzMs+/vpyhAxyRkUPdY2T5
	 LDXAybAHL+VYA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3C8204891E;
	Tue, 10 Nov 2026 07:11:02 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/5] iommu/rockchip: page fault and reset handling fixes
Date: Tue, 10 Nov 2026 07:11:01 +0000
Message-Id: <20261110-iommu-rockchip-faults-v1-0-b1dda574dbb8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1gYmWlrwKuJCY6xp1ZGJIwXx7
 p3a5Vv8f4BJUDGosgOC7GrqlwTKM+CxXZ6C2idD4Yo7ETlUP88Rg+c3j7ri0MZpM3RMciMuS+k
 fkNo1yKCf61s3f1vsXsLbbwbn+QVgbv1SeQAAAA==
X-Change-ID: 20261110-iommu-rockchip-faults-0c1e41c33ed7
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Jeffy Chen <jeffy.chen@rock-chips.com>, Tomasz Figa <tfiga@chromium.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294661; l=2716;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=EVE6rslJ+MxVLh2zqLrK9ywoULAK+Ds7e7R8Zqqqths=;
 b=9bGcN+GIhtCncaZ8ZLHC53JlkjNg3jVgIgvQEQAkW4iSUdfYezFR7FGwUR8NRUoZnzZEL+Yid
 iB8ETkxsDd3DIUTh0Ydv54S7RXFOQry1UXqIuXxjBHL/4bqaizplv0U
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes for the Rockchip IOMMU found on an Orange Pi 5 (RK3588S) while
making the video codec drivers recover from bad jobs (Hantro VEPU121
JPEG encoder, rkvdec VDPU381 decoder):

1. log_iova() walked a page table that a master's own reset had taken
   away (DTE_ADDR read as 0) and oopsed under KASAN.
2. A master that keeps faulting on unmapped memory printed three lines
   per fault from the hard interrupt handler; on a 115200 baud console
   one bad job kept the CPU in rk_iommu_irq() for 2 s. Rate-limit it.
3. FORCE_RESET swapped the poll period and the timeout.
4. The stall/paging helpers skipped a bank whose state differed from
   the other bank; the two banks of an RK3588 decoder IOMMU were read
   back in different states after a reset that timed out.
5. In a page fault storm the IOMMU now leaves the fault pending (which
   holds the master) and masks the interrupt until the master's driver
   resets and re-attaches it, or 100 ms pass. Before, one bad JPEG
   encode job kept CPU0 in interrupt context until the soft lockup
   detector and then the hardware watchdog reset the board.

Tested on an Orange Pi 5 (RK3588S): patch 1 with an rkvdec fault
injection run under KASAN (the "page table lost to a reset" path taken
14 times in 3178 decoder recoveries and 96 injected faults, no other
report); patches 2 and 5 with a VEPU121 JPEG encode job given an
unmapped input address, ten times (the storm held after 65 faults,
rk_iommu_irq() 0.8 to 1.7 ms per bad job instead of 2.02 s, the
encoder's timeout reset the core every time, and the GStreamer pipeline
that used to lock the board up ran to its end ten times). The whole
series has been in the board's kernel since, including MPEG-4 and VP9
decoder bring-up runs that hit page fault storms and recovered.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (5):
      iommu/rockchip: Don't walk a page table that a reset took away
      iommu/rockchip: Rate-limit the page fault reports
      iommu/rockchip: Fix the poll period and timeout of FORCE_RESET
      iommu/rockchip: Don't skip a bank whose state differs from the others
      iommu/rockchip: Hold the master in a page fault storm

 drivers/iommu/rockchip-iommu.c | 217 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 192 insertions(+), 25 deletions(-)
---
base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
change-id: 20261110-iommu-rockchip-faults-0c1e41c33ed7

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



