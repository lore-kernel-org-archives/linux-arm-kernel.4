Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jdBNRwOR;
	dkim=pass (2048-bit key) header.d=firstview.fi header.i=@firstview.fi header.a=rsa-sha256 header.s=google header.b=MttCHAhv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ace5+urjCHWFo+TlmPzx0dahoTv3/RJUVE6hs+uDPTM=; b=jdBNRwORExwsmRE6DNEMv9bbU4
	zPJuQFiFldmBe2VmIfGdktaclMMjCNw/1z8ZznwQN5XECrOqv4T8tl6V0SSyZdeyfuKpQ2K+2SbC0
	nuWVWT9HFkvsEMEZj+z7rA75DzCepCGyJcm3pva7Zqtf+U0161OjsyZ7HjNw4PPqdyBpdUuRw4nis
	p3KzeIiygUIoVI05/JjspJfAS3q7z3UC4sqxSmMd48ZnCm3jW2GNSbIlA+NEwoNfr6SCfeHOBOoOs
	KAZ+nHzaC6VAeQXi33Khftqonm3xDKUWY6TJYGvRq4YH7Nk5QsiRKROuwrGamEn3YUn0EOB7HtOfc
	g4+6wqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr4l-00000001Osn-1tsC;
	Mon, 16 Nov 2026 07:24:27 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSr4i-00000001OrC-0LnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:24:26 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so28408481fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=firstview.fi; s=google; t=1794813860; x=1795418660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ace5+urjCHWFo+TlmPzx0dahoTv3/RJUVE6hs+uDPTM=;
        b=MttCHAhvpaopQZ0pHHyCCSTUo4RgzM3gBRJTqGipavuoO2F6hnjY9cnFLtPukhxAzD
         bdzY/aUy9KXpUSwN1aXKA2RIPpfj/tapLlEbD7Wmo2LNk9Bx1GFti+Vmh2+KF+Fm6hY/
         qK7tMGUW7LTv5PQQc5oS6JHdNq4BcHkVON2uIxYN40aiiICv/LoXSi9mNTaEfXmAtwe7
         vDf12gD7/0TfUfMAzJkwN7akDHCwzWC6TmtLccEfa8Jk7mKFBpZzYUg5XLdjN+dDu305
         dglF3h1xLcs5s8+RMk/lIor228vjaKJpN0Ce+X1B/jH7TbonTgMXqC6bdJ3kPUdRjsKi
         JZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813860; x=1795418660;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ace5+urjCHWFo+TlmPzx0dahoTv3/RJUVE6hs+uDPTM=;
        b=XkKgsRX7jM6WrJdOjNTBOub54TgbOB4TqWmm2H48eYNXszALqW8kYQZfsokE1V/ROW
         0KX3sHyb8hX1B00PXXd4Hp9Fi4Dd29hp552Q8eFrjcw31wEvPXwkUg577XwqDVY25FRc
         tzQ5Abn+Yq6NMLZtUseXKaDyrhKoR92M5NJWKkb6edF06698NkbK+VKlk4JLmDwCoKQU
         y/Bf4js186XWNp1Q8IdpKvT2C7R5eR29L1wIkGAQvflVYjh5GD6RZD/2GLhILrs7+Ny8
         L6jKjhMYjjoQP2/49iq4uP3znjhL+Xw29K5CUB3JTnL89gRVSqDBNFTBs8RzPiD1Hw1L
         ZvpA==
X-Forwarded-Encrypted: i=1; AL+hErGiFttTpARDJQ89P2qCh93NSzDih6kCjY9zqXamhrtfFJo+yKcISNi/T230oFq94YtFbCKvMa7yBrX7pqjfkN2z@lists.infradead.org
X-Gm-Message-State: APuU4Z8Zugd2dc7cUVLBcvHkJ5iHuw+GVMrewYI24DfzOK1mUKbNGwx9
	uCmGkoYnLHrf80CO9CRB0G3rDsRMuqZbKzVSu6zjJYIHcWfulcRfeciwq34V7yL26aU=
X-Gm-Gg: AYBFou0idoaD2QHvUX24sms0wqZLAOWgNnolJ1sgc865Rn0qi5aAAnDJ/Qq4bn4IwNZ
	3mT4vMWjjbVUZKv3xVvQK+ysGfw3YBDIb4dW1n7uZm2xxvKLwEPBB5MEcPrOpljrLuWaE47EQaC
	Ro4UFhiNwhzvrLf6a6Bs6wHPssrLbf53VYD4NPIdxObe7E4iA8gGjP7kwx3oslIL7pwYSKOh94K
	+rtWA0D7Zj5j+K8bj7XcGHUJ1Q6Gu1B1JjS1jLSnGMiqR93eMqy6lk0BPM0dWw5I55cb1UBmpYM
	sALrkHiexXvWaPXJwgEbxnUb0x0JlKHFAWG3jEcDD8hF0itKYAvr4/BUMKKTxKjAHdNeY0lGcne
	kUezWWPS0qdCIXWaG14wNPgotDs8u8odCbq47iM+dnZyNjmGn1/hlEgD4tTwBgBrs8A+C5EYlfx
	P+BBrhNqeUQdcii0kmqmlwd6ebJmhNod3viHJY4QGgIDFMZWut1hoFLsXN/RbAWXuqFby70EXjc
	n9ZKaer6ENBy2vOUztVD/DnPKqWxoi7DevJb6uPWUzYBiDgUS1tgZTRN0ugyefOfsPqBmKRMzA7
	d/sqVOsXp5Iq9d7N4BEjALPjSV0WORVbCM/mjtKJbMFBwJL7UmWXhSh9CkirE07KJPUs
X-Received: by 2002:a05:6512:2528:b0:5bf:d54c:1fb1 with SMTP id 2adb3069b0e04-5c1705d6fd4mr3416878e87.2.1794813860256;
        Sun, 15 Nov 2026 23:24:20 -0800 (PST)
Received: from lucifer.alanara.fi (86-60-194-130.dynamic.lounea.fi. [86.60.194.130])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171333768sm3018347e87.16.2026.11.15.23.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:24:19 -0800 (PST)
From: =?UTF-8?q?Jussi=20Alan=C3=A4r=C3=A4?= <jussi@firstview.fi>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jussi=20Alan=C3=A4r=C3=A4?= <jussi@firstview.fi>
Subject: [PATCH] platform/raspberrypi: vchiq: Store a msg_queue entry before publishing it
Date: Mon, 16 Nov 2026 09:23:39 +0200
Message-ID: <20261116072339.2821648-1-jussi@firstview.fi>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_232424_204880_CA167369 
X-CRM114-Status: GOOD (  35.01  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vchiq_msg_queue_push() advances msg_queue_write before it stores the
header in the entry that the new index makes visible, and
vchiq_msg_hold() advances msg_queue_read before it loads the header
from the entry that the new index frees. Neither side orders its index
update against its access to the entry, so on SMP the thread on the
other side can see them in either order.

The consumer can see the new write index and load the entry before the
producer has stored it. It then gets the header left in that entry one
lap (VCHIQ_MAX_SLOTS messages) earlier. That message was released long
ago and its slot recycled, so the consumer parses whatever the VPU has
written at that address since, and then releases it. The message that
was actually pushed is never seen and never released, so the slot that
holds it is never recycled. In the first lap the stale entry is NULL.
With a full queue the producer can likewise see the advanced read index
and overwrite an entry before the consumer has loaded it: one message
is lost and the next one is delivered twice.

vc-sm-cma, the queue's only user, logs the stale read as
"vc_sm_cma_vchi_rx_ack: received response 1818324333, throw away..."
(0x6c616d6d, the MMAL header magic of another service's message now at
the stale address) or as a response of 0. On a Raspberry Pi 4 decoding
short H.264 clips in a loop through bcm2835-codec, 14 messages were
lost in 23.5 hours, about 35,500 decoder teardowns. Each lost message
pins one of the VPU's transmit slots for the rest of the boot, and a
pinned slot stays charged to the slot quota of every VPU service that
has a message in it. At 14 pinned slots the VPU stopped sending on its
MMAL and SMEM services at its next slot boundary. That matches vchiq's
default per-service quota for 31 slots, 15: 14 pinned plus the one
being written. From then on every attempt to create ril.video_decode
failed with -ETIME until the next reboot. Every lost message that was a
VC_SM_MSG_TYPE_RELEASED also left an imported dma-buf referenced for
the rest of the boot.

Store the entry before publishing the index, and load it before freeing
the entry, with smp_store_release() for each index and
smp_load_acquire() where the other side reads it. The queue has one
producer (the slot handler thread, through the service callback) and
one consumer (the service's own thread), so a release/acquire pair per
index is all the ordering it needs, as in
Documentation/core-api/circular-buffers.rst. No lock is required.

The comparison kernels carried a test-only delay between the two
statements of vchiq_msg_queue_push(). Even at 0 that hook adds a load
and a branch between them, which widens the race. With this patch, a
kernel ran 3,001 decoder teardowns, half with the delay at 0 and half
at 500 us, without losing a message. Built the same way without the
patch, it lost hardware decode after about 600 teardowns, twice, with
the delay at 0.

The cause was found, and this patch written, with an LLM coding
assistant (Claude Code), working from the log line above and the
vchiq and vc-sm-cma sources.

Fixes: 77b3f6c49105 ("staging: vchiq: Move message queue into struct vchiq_service")
Signed-off-by: Jussi Alanärä <jussi@firstview.fi>
---

Notes:
    This is on top of drivers/next, where 0d6409fd70af ("platform/raspberrypi:
    Add VideoCore shared memory support") adds vc-sm-cma, the first in-tree
    user of this queue. Its vc_sm_cma_vchi.c pushes from the service callback
    and holds from its io thread, as the Raspberry Pi tree does. There is no
    stable tag, because no released kernel has an in-tree caller. The Fixes
    tag is there for trees that carry vc-sm-cma, the Raspberry Pi tree among
    them. The vchiu queue that 77b3f6c49105 replaced stored the entry before
    advancing the index (with no barriers either). That commit moved the
    increment first.
    
    Testing was on a Raspberry Pi 4B, on the Raspberry Pi 6.18 tree
    (6.18.50), where this file still lives in drivers/staging and the same
    change applies unchanged. vchiq and vc-sm-cma there were stock. The
    kernels used the shipped config with no debug options, and every run
    started from a fresh boot. Each lost message was counted three ways: the
    "throw away" line, a slot that stayed claimed across two reads of
    /sys/kernel/debug/vchiq/state, and an orphaned dma-buf. On the long run
    below the three stayed equal, at 13 each, until the 14th loss.
    
      kernel                    teardowns  lost  pinned  hardware decode
      unpatched + hook at 0           605    12      14  lost at 24 min
      unpatched + hook at 0           608    14      14  lost at 26 min
      patched + hook, 0/500 us      3,001     0       0  kept
    
    The 23.5-hour soak run used a kernel that also carried unrelated
    bcm2835-codec fixes. vchiq and vc-sm-cma were byte-identical to stock.
    It logged the first lost message after about 3.5 hours and the 14th at
    23.5 hours.
    
    Not done:
     - this change has not been run on mainline or on drivers/next. There
       it was only built: arm64 defconfig plus BCM2835_VCHIQ,
       BCM2835_VCHIQ_MMAL and BCM_VC_SM_CMA as modules, CONFIG_WERROR=y,
       gcc 15.2.0, and vchiq_core.o again with W=1, without warnings. The
       diff is the tested one with only the path changed.
     - no long natural-rate run of the patched kernel without the hook.
       Stock loses roughly 2 to 4 messages per 10,000 teardowns, so showing
       the patched rate at least ten times lower that way would take about
       160,000 teardowns.
    
    Not addressed here, and happy to send separately: both functions take a
    service reference through find_service_by_handle() and never drop it,
    so every message leaks at least two references. Also, the vc-sm-cma
    "throw away..." print has no trailing newline, so the line only reaches
    the log with the next kernel message, sometimes minutes later.
    
    On tool use (Documentation/process/generated-content.rst): the analysis,
    this patch, its changelog and the test tooling (the delay hook and the
    counters above) were produced by Claude Code, an LLM coding assistant,
    in several sessions under my direction. In short, the prompts were:
    explain this log line from a soak test, fix it, and prove the fix on the
    bench. The same assistant ran the hardware tests on a Raspberry Pi 4
    through our lab tooling, and did the build above. I have reviewed the
    analysis and the patch and can answer for them.

 .../raspberrypi/vchiq-interface/vchiq_core.c  | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 48d6b1d74329..a5cd7e2a9dd8 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -2654,15 +2654,26 @@ void vchiq_msg_queue_push(struct vchiq_instance *instance, unsigned int handle,
 	if (!service)
 		return;
 
-	while (service->msg_queue_write == service->msg_queue_read +
-		VCHIQ_MAX_SLOTS) {
+	/*
+	 * msg_queue is a single-producer, single-consumer ring: this function
+	 * runs in the slot handler thread (the service callback), and
+	 * vchiq_msg_hold() in the service's own thread. Each index has one
+	 * writer, which publishes it with a release; the other side reads it
+	 * with an acquire. This acquire pairs with the release of
+	 * msg_queue_read in vchiq_msg_hold(): an entry the consumer has
+	 * freed has also been read, so it can be overwritten.
+	 */
+	while (smp_load_acquire(&service->msg_queue_read) + VCHIQ_MAX_SLOTS ==
+	       service->msg_queue_write) {
 		if (wait_for_completion_interruptible(&service->msg_queue_pop))
 			flush_signals(current);
 	}
 
 	pos = service->msg_queue_write & (VCHIQ_MAX_SLOTS - 1);
-	service->msg_queue_write++;
 	service->msg_queue[pos] = header;
+	/* Publish the entry only once it is stored. */
+	smp_store_release(&service->msg_queue_write,
+			  service->msg_queue_write + 1);
 
 	complete(&service->msg_queue_push);
 }
@@ -2677,17 +2688,21 @@ struct vchiq_header *vchiq_msg_hold(struct vchiq_instance *instance, unsigned in
 	if (!service)
 		return NULL;
 
-	if (service->msg_queue_write == service->msg_queue_read)
+	/* Pairs with the release of msg_queue_write in vchiq_msg_queue_push(). */
+	if (smp_load_acquire(&service->msg_queue_write) == service->msg_queue_read)
 		return NULL;
 
-	while (service->msg_queue_write == service->msg_queue_read) {
+	/* The same pairing, while waiting for an entry. */
+	while (smp_load_acquire(&service->msg_queue_write) == service->msg_queue_read) {
 		if (wait_for_completion_interruptible(&service->msg_queue_push))
 			flush_signals(current);
 	}
 
 	pos = service->msg_queue_read & (VCHIQ_MAX_SLOTS - 1);
-	service->msg_queue_read++;
 	header = service->msg_queue[pos];
+	/* Free the entry only once it is read. */
+	smp_store_release(&service->msg_queue_read,
+			  service->msg_queue_read + 1);
 
 	complete(&service->msg_queue_pop);
 

base-commit: 0cab822bca7a59667774725b83e948b71462290f
-- 
2.53.0


