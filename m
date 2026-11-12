Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA9606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oxX4FvuI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fHuju1yo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u120nBzjSw85Ua4h2iZr2dC7vRzrh960a8a37kW/TOg=; b=oxX4FvuI9V7P1lSiq6CkaqLi2L
	bXz7TDHhimm0yMZzJvaSW3qP/ET+EFaL0jIaU7/WON+s5ui6gurXx5Y9mkQLdlWQhzbuHz+Yv0/d0
	YMa4ipymZf6T6CMoao+SoeQ22s7nw+cVl7JHYy4vVEaQDykUD25lbYMY+3JKRZ+KEurBpuX5KmaYh
	NAMujBa2qtH3JitHaUb7xuiZsjiObhKB8pfNL2kdYzCA0XdPKegcX/cbpD7bx4qE6KaWDQcoF+iGi
	iV8o2io2ELn5Jxz/7EwPHw7/j0N7UZGCb2LnsJ2hbjQv/cVtzWmXOkMEl/qviZLLdgBODkGGyYkIX
	1iFLVi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ63-000000095Op-1FiT;
	Thu, 12 Nov 2026 08:23:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ5m-000000095HS-3R2N;
	Thu, 12 Nov 2026 08:23:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91A6641874;
	Thu, 12 Nov 2026 08:23:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471814;
	b=B17NsFhy7xxMD9nOKAx46/g5NP3k5697f/lmpSCd7e5DkyfNIqEF1aHXq9sqWxUDYTvD
	 y70DF+xvaVIZ1CCoz+TJlEyZEBOVo3nS8lmP45yEN/6QWAfu6I5RE4gX41wAeKL0c5gQI
	 4Wd2Ldl5zzj4eiRynVmioBJqKhRF76hJYFG24g85nY7hytAgqizu/wNItqhlZkQa3uzyL
	 gAdc0+LdbmWjnRwTehEoSeE/B19wVo4iB+4dvi1PuKCf56C6BBTREM6DMXbKb20fTQf17
	 5ZBC+snIFRjzgrwnh2fsCH0/Du3DuFS7AIVj8nBHllMOxX6DN6fv9hheumPaOOcxP3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=u120nBzjSw85Ua4h2iZr2dC7vRzrh960a8a37kW/TOg=;
	b=XNiUTKlj+VcJG2TaY5g0vUTiT5FFaIWkueJPWxeXMEXdMwjzoxcR1YRRIDUMuKNTREiV
	 B5t0q/YjwyvrFiqFFuVbxK5kNMsQyXhRD/FyvG99rqB9nlpiQBv0pBp7bUGzDA6RQfbDI
	 ymuOrLj3mOcKxi5pyc4Hj9wRXX3JnJFdN4DmL3PRhymEf20gSJB0kPc0a8YKjqjpaZ6Jv
	 EUx9ZPU8FxUn3knGXFAy2CbL6qx4Xs30RzTcMm3iVV/j0JknvOk+KpoOOLn1gdBVyDK0o
	 SNUzvjSe0SF+HEnMf4w5Sw3nViQErN4rodxUYYMKBx8VgJAQQrc16/VQQwb+dnYyYPA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 50FE61F00AC7;
	Thu, 12 Nov 2026 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471814;
	bh=u120nBzjSw85Ua4h2iZr2dC7vRzrh960a8a37kW/TOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fHuju1yofLcm+DkrzDe5jxxSB3FZtaZdhyu/vcxW+SntVc8byG/Zjz8SCkWcVw41O
	 DidKV9m6+7o9wXPOFt1mxLq/RIWbY81dTBcAkM+qb3grwddDi7RQsj3MbBnWyPQStY
	 YbbbmDX95sFFxAc3duMqNEOF3cC2UqZsQzsxqQJk4jteXSUzHYJvDFg+vdsC7uw69/
	 dTR4abeWqSKdqqlkPtsBlfwAlrhUJihxJhsT1ztu3Eu0Ev7b89Nh88ADc/07Cl6TyO
	 3aAZ4cGi8LvyBspy8IvF8+UtXSRjRZttRpPm/gccccWCY4FGI9X3hlmwgVkhFdKA3G
	 KMGOvawRFJjZw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D995349360;
	Thu, 12 Nov 2026 08:23:32 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:23:33 +0000
Subject: [PATCH v2 1/2] usb: typec: tcpm: Don't cut a pending state delay
 short on a re-queue
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-tcpm-attach-reboot-v2-1-b4bc6ca83490@gmail.com>
References: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
In-Reply-To: <20261112-tcpm-attach-reboot-v2-0-b4bc6ca83490@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Arun Iyengar <aiyengar1990@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471812; l=2363;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=f9cETtbmuMeuYvGKqDaJesYJ7nf3lLCpDNSETJ6OO1Q=;
 b=8LeYYkVSV9H3DvqyT645JP9izzuqYaWIgQ1uDLbfjiBRX8POMf/uQ34dp9ygJq6VmUe61ARjI
 B8WrR2TZDkLClcHrFvxrxbeZrGee24mdnZzilLL+3t+VslFG/oqOok8
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
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

From: Arun Iyengar <aiyengar1990@gmail.com>

tcpm_state_machine_work() applies port->delayed_state as soon as it
runs, assuming it only runs when the state machine timer fired. The
work can also run because it was queued for another reason while it was
already running.

This happens at every port registration: tcpm_init() runs with the port
lock held and calls tcpm_set_state() twice with no delay (default state,
then PORT_RESET). The first call queues the work, which starts and
blocks on the lock; the second call queues it again. The first run
handles PORT_RESET and schedules PORT_RESET_WAIT_OFF after
PD_T_ERROR_RECOVERY; the second run then applies it at once. On an
Orange Pi 5 (FUSB302) the log shows the 100 ms ErrorRecovery taking
6 us:

  pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms
  state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]

so the "clean slate" that tcpm_init() asks for never happens.

If the delay has not expired yet, re-arm the timer for the time left
and return, as tcpm_send_queued_message() already does.

Fixes: 3ed8e1c2ac99 ("usb: typec: tcpm: Migrate workqueue to RT priority for processing events")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index d721baef5210..0a19b7665555 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6569,6 +6569,18 @@ static void tcpm_state_machine_work(struct kthread_work *work)
 
 	/* If we were queued due to a delayed state change, update it now */
 	if (port->delayed_state) {
+		/*
+		 * The work may have been queued again for another reason
+		 * while it was running, for instance by tcpm_init() at port
+		 * registration, which sets two states in a row with the
+		 * port lock held. Do not cut a pending delay short; re-arm
+		 * the timer for the time that is left.
+		 */
+		if (ktime_after(port->delayed_runtime, ktime_get())) {
+			hrtimer_start(&port->state_machine_timer,
+				      port->delayed_runtime, HRTIMER_MODE_ABS);
+			goto done;
+		}
 		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
 			 tcpm_states[port->state],
 			 tcpm_states[port->delayed_state], port->delay_ms);

-- 
2.55.0



