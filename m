Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F136606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 01:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fAdXfBX5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuONZPZW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=; b=fAdXfBX5AL9iwlYpm+ZStHZyNb
	U9VJgmgvq37gDPCfOkFo+EfucmMi6kslMxbWRuJjeGznx3hsoYlodl0TucG6dMSdGL3V8za8IoSEo
	ubw0RiC63sm55X4vCGbbpwM3oQ0qVZK9k0zII7Nb+VaqwhP/tbxxWrnT3rZ9PWlCY+iNlZbjb24gI
	nSN5HodIYblW5sK1CWyRRrt9Pe4GmKjEP0dJhmqmP5/56RCc4QoizFqTRbM5eLmtX22DE9PPonQMg
	qObLi2HWFAxPxH2j5vDmTwc18k86znesEnInnpH9c3NiJljK6BeQJhwojlW85ugQZ3DJGvpavqNuv
	5UFEVy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWkgJ-0000000Ej0a-20c2;
	Fri, 27 Nov 2026 01:23:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWkgG-0000000EizH-0OSq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 01:23:18 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2f05b465cd1so41218235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 17:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742594; x=1796347394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
        b=SuONZPZWa4+BK1Cu7Kc1eMoqK1hyXLSbwmbPnypz0XheYqbKRiaoV9UTZkCLedHUvE
         Da+4oh7CbpTF4Sr9n96US89nI7EeXM6daLhsF47g88ZgNFw8l/axppDLsx8n/iTB4g78
         DMff3zbWe0NMf63vFrSEjLe6eqD0XCSspnKSjejJq5WqRgBUx0vXFjEq6j/pKBU4AACk
         /GTYwoN4MbgA4hNarn7S9mB0a6EEqbzyhwIbuGPY6dJUC3Luq3b6atgMXrZtRZp0/ERb
         aTuExkHpa/zE1Vdy3oUDfJhYGT4ekHwKqXHPgq69U16iCAS+HYrDqp93el7gEdvVZw0j
         10aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742594; x=1796347394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
        b=c8JOc1OWqLT+wpng98rXFDuENCF8GOUfg5136CiZY+1VhdmJhl1pLqJJrdJi8Wu8ZG
         AZEWBywRa2P5lJNgOtDOR8J6AzlDux2PDvIUjFeorMczB9+8W8v+2pySq6L/0D513BFy
         dAXOUfuRfivvsBYOT4g02Wvd+tcVY/MZr1f8b3wHHG6hpPCr8VgJSF24UJUQUWdj1rqx
         ZFiyj1ycwyaorL/RHlATRdEdgpBMbJmX8JMaoMHxkPVIGmJkKjW0PaYX1I0X2iDsicDn
         G0yH3ckCzoJhClP/GuWwb6APYNRRyOSu8YDIIuw+x20CeRCdjCivSGxIrMHcKS3/6D1I
         mmFQ==
X-Forwarded-Encrypted: i=1; AL+hErFhnyaMp2BOhdOBllTaDopuo4dQhl5pcXGAPUy1D78+KNd5gYnZHhAW1iLfMZk05MziAr06l1PisXh3I+4ssg6R@lists.infradead.org
X-Gm-Message-State: APuU4Z9p+qGKhemvLt9mV/XG0ACJUCiqc+ZECwC41tAeleh5DvILud5q
	gRImhx209h4AJnYPi9zHl0in+OokYAnOftc5/gLjH7Lu+UNV7GvJX4ad
X-Gm-Gg: AZFdTZeoynPxpnuLOsLMJhcSny8zdfpZhimd+88bdnTBN/XP9NQ7pL64SmsTrYh3Z+r
	K09w1NGQo5w3dXANX5OEemp4q+DS27fyUwRSbP5bQscoxY38n0KrPchYQEpxqYV/J58BfmX0BUq
	0vad05AY/3uALRi/hMvkGebV4AMsz6z01HCz33bIumi0IMpLHjluB7ZDqOQZtf/p1T8D+sD5Pe9
	bwzHjXTWeZ8PSztpL/jfigyFBXIhsAxjT9dKNHt8k0nuMvmSVmkDKdHkhmAKHFLvuSOoXBb7fMk
	lhrRofAbVB1Wo/D1eOF98cNrXc/eNlJUBjC4N7mbMV7iKqkGn0iFbZqq+zyh7Ritjy+TQCmq8H4
	7fXG6EJR3rRxozlZBVRjJi8P7eBqQnRU3OReslRZlMWhnKIVD2ZZsJSYdR+Cr61WWzdt4oky1w6
	iVG0BN7IQpbLLS1VC206rtNf+Ex89vLq6j+Vndso+sWoRx30vR2aYidS3WxXJ+MlPkcp/9Gyu33
	0Pg27aAZ6qyh/loyhl4NH1mYhjesCjN5dh2eNGr6l/F2zJtw/Kugkr69P7ypOhkzlCC6pzxfWDV
	kUmzb/kN8nzDgHoCNjQJYiRbeJzeYQi3542ldwbNBKwZpVaxM4z2iwyrjv4ydEc+RaNhWLaIYxI
	hYpVJwLA=
X-Received: by 2002:a17:902:ec8b:b0:2e9:7ff5:5462 with SMTP id d9443c01a7336-2f03f1187f6mr190865485ad.22.1795742593661;
        Thu, 26 Nov 2026 17:23:13 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10866465ad.55.2026.11.26.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:23:13 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>
Subject: [PATCH] media: pisp_be: Set the field of OUTPUT buffers
Date: Fri, 27 Nov 2026 09:23:08 +0800
Message-ID: <20261127012308.682831-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_172316_140041_DC708BEA 
X-CRM114-Status: GOOD (  14.49  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver has no buf_out_validate() callback, so an OUTPUT buffer
queued with field V4L2_FIELD_ANY keeps that value, while the V4L2 spec
requires the driver to set a valid field on queued OUTPUT buffers.
v4l2-compliance -s fails on all three image input nodes:

  fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
  fail: v4l2-test-buffers.cpp(1608): buf.qbuf(node)
  test MMAP (no poll, REQBUFS): FAIL

The Back End only processes progressive frames, and its formats already
report V4L2_FIELD_NONE. Add a buf_out_validate() callback that sets the
field to V4L2_FIELD_NONE, as cedrus and hantro do.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39, with this
change applied to its pisp_be module):
- after queueing an OUTPUT buffer with V4L2_FIELD_ANY, QBUF and QUERYBUF
  return V4L2_FIELD_ANY before and V4L2_FIELD_NONE after on video20,
  video21 and video22
- v4l2-compliance -m (without -s) passes 400/400 before and after
- with -s, the MMAP tests no longer fail at QBUF. They then wait for a
  frame that never comes, because the Back End only runs a job when the
  config and output nodes stream too, so the full -s run can't be used
  as a pass/fail result on this device

This change and its description were written with the help of an AI
coding assistant (Claude); the testing above was done on real hardware.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Roy <rongh7426@gmail.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 8fb7230..95c4f7d 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -847,6 +847,16 @@ static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
+static int pispbe_node_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	/* The hardware only processes progressive frames. */
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
 static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
 {
 	struct vb2_v4l2_buffer *vbuf =
@@ -958,6 +968,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 
 static const struct vb2_ops pispbe_node_queue_ops = {
 	.queue_setup = pispbe_node_queue_setup,
+	.buf_out_validate = pispbe_node_buf_out_validate,
 	.buf_prepare = pispbe_node_buffer_prepare,
 	.buf_queue = pispbe_node_buffer_queue,
 	.start_streaming = pispbe_node_start_streaming,
-- 
2.51.1.windows.1


