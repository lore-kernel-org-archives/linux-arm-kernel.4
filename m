Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3ESR3JWy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lRSOelAP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JhX6GJToIPCSWTgKM33kXD6qd9kkvSZE3MFHQwmpZfQ=; b=3ESR3JWyOTaUTiuE1nTZ5XgRa5
	xxFznk1IicdgElyOxYylZ2Vw7KTTT8wQZlZmD576fbWqtGh/ZzDmXfVbgrt4/zLCaH6a5mtLDuE5l
	0d6IjqupsO6rqgVhbdx0N+HDyt53m6REuz2mWsy7SHZGSDDH6BiqTx/SdxiExacyj52Bu4DtGw6W+
	jcpOR6aCyyf/R+6vr5OyYruUr5sZ+8G70ofRnOKfN6ZjjUzBmOAwHEAtkAnvm2C2+S9K3kp2er7T1
	2w28rA0Wz7fV2SBQ/cK0qT19I9w/d/GU5nPjaVncyRqKXQhwne7AD2KyDZ91gORh5Fuu5AHf27g/0
	jkjN61XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVql3-00000006eha-28mW;
	Tue, 24 Nov 2026 13:40:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVql1-00000006ehK-3TVG;
	Tue, 24 Nov 2026 13:40:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 470BA60EE8;
	Tue, 24 Nov 2026 13:40:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795527626;
	b=IKwLydFBd7+Kj9nc6xiATlMRJrZCdG01xvBYZCV4eFlxGCJ8Uj4A1NORVTrzfE8NBVE6
	 6f12hBXGX82pTRAmDx89ZNy/dT1PwXZcIzTVq6kdrKjxBijwbPuOccrtzt4D+5jj67K4l
	 ed2pkDTaAIS+XG+YoRERXa89HvBKqK/Njuiz4TLYLZgr9BhBgRkC7R1+AZe0a71pwMrjr
	 yCrUaaIWvvRJ7k6dfnPsiTBmeVAW2GtGnc2cr/SxYEgyZwqk9mtLYGAs12giQzzZbusrj
	 SCYCvFoCM0jpGBfGnsIUoDMdxhi83n/ebSJFZNqBXhy2vT9WUCeB+9TZC9I+nQFVayg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795527626;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=JhX6GJToIPCSWTgKM33kXD6qd9kkvSZE3MFHQwmpZfQ=;
	b=Ghu9iPaA7s7D5t2xbwuTpiXrH2Fqu1VGyTV5sgzAAH+DXHD+Ht+xc/Emi0OkXQyjB8to
	 q3eTcRJIp2eYvLEhLcmhI32GqjzL55fg3SpnR3y1lDiM4m3lf3FG5n0wuLivQmVejtmqP
	 foDfA3e0jsHClAjJuOi8hIhMAnhoeS4hrgXrfXEvR1ZdBhd+cTQtoPhRzN2TbJoS9aPCh
	 kcocjavUZwvldnAHlDJK0xyC/bI+WmtG+XTb10ThIrfxjjT5Z7UcRP3oclYKNnKOInoR4
	 iFWx6H+tsqE/E0r/0NU4qD7rfrqO6KtS9YhHiXynz8a78eXKOir+xF96ZMC8o+r1SUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A76581F000C0;
	Tue, 24 Nov 2026 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795527626;
	bh=JhX6GJToIPCSWTgKM33kXD6qd9kkvSZE3MFHQwmpZfQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=lRSOelAPN1fpJMrE92QGIFiQwGPIaaPyds/gGKQYpQhUqKatfXGEcPXwrlnMURK5M
	 8cuy89KILRT9cUvgPHMTux8oRcgPmaKoPbhLAaz8w4M8MIyAeGc8c9ta13DBy7P85X
	 l0gQtBAKxAnKkgO9n0tKKqsfy4aacLPQT2ZO4VMCKz8ABK4QOAySCiDqWLcmvAbKla
	 UayrDaxVvpcgtj6IHE4vtyY2PuwZpSysXv0Y8UEnF7dx5ELk/gk0zHOTiiY6Zcctl/
	 hcUEUugtHzIx76OLM267L+mSFoqtD1kDHBethUjWaHYymuZ+BDCdT8iWeqhqKB/b+1
	 noGPwSFcLlo4Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3861A4CA5B;
	Tue, 24 Nov 2026 13:40:21 +0000 (UTC)
From: Sergei Khomenkov via B4 Relay <devnull+shomenkow.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] media: verisilicon: fix JPEG encoder writes past
 the CAPTURE buffer
Date: Tue, 24 Nov 2026 16:40:16 +0300
Message-Id: <20261124-hantro-buflimit-v3-0-780903970ca0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNwQqDMBAFf0VybsomYjQ99T9KDxo3uqCmJDa0i
 P/eKBQEj/Ng5i0soCcM7JYtzGOkQG5KkF8yZvp66pBTm5hJkEoIUDyNs3e8eduBRpo5FAVWIHW
 DMmfJenm09NmLj2finsLs/Hc/iGJb/y19akXBgVtoKmVQCVTq3o01DVfjRra1ojz4As6+3Hxbl
 hpatNqao7+u6w/R2YDI7gAAAA==
X-Change-ID: 20261106-hantro-buflimit-055e8029be23
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527620; l=3845;
 i=shomenkow@gmail.com; s=20261104; h=from:subject:message-id;
 bh=CS9Hh2KOnLAmmovBFtvM/OChuActMNOyzEIbmU8KbTc=;
 b=y17AVohcoo/KohpGkVwr+Ely6dXWd6I4yYSnnuzNlvSkAMEJvfHGiBx1esxZ7X04A3R7vSKwQ
 3i8ptxwqT4MAbW5cmI5aHdACqvfkRQ5iPFh1yaZPPIAp6l2S+5UkOJs
X-Developer-Key: i=shomenkow@gmail.com; a=ed25519;
 pk=FwuHDVe7aiISDMLmQEcMC+RflEIJ6kEp/ekwznWXmI8=
X-Endpoint-Received: by B4 Relay for shomenkow@gmail.com/20261104 with
 auth_id=1409
X-Original-From: Sergei Khomenkov <shomenkow@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shomenkow@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H1 and VEPU2 JPEG encoders are given their stream buffer limit in
bytes, but the register counts 64-bit words, so a stream that does not
fit the CAPTURE buffer is written past its end, up to eight times the
buffer size. A quality 100 frame of noise does not fit the default
sizeimage, and userspace can also set a smaller one.

Patch 1 stops the encoder in the VEPU1 interrupt handler after a
buffer-full interrupt, which leaves it paused. Patch 2 programs the
limit in 64-bit words, rounded down to whole 64-byte bursts, on the H1
and on the VEPU2. Patch 3 makes the smallest CAPTURE sizeimage of the
JPEG encoders the 624-byte header plus one burst, set in the variant
format data.

Testing, on an RK3026 (its H1 is Rockchip's VEPU1) only: without the
series the encoder wrote 230 KB past a default-sized 640x480 buffer and
1.6 MB past a 1920x1088 one. With it, 17 overflowing frames, four of
them queued back to back, stopped at the programmed limit without
writing past the plane and came back with the ERROR flag, one interrupt
each and no timeout; the jobs after them completed, and frames that fit
are byte for byte the same as before. A sizeimage of 1 or 600 now reads
back 688. v4l2-compliance 1.30.1 on the encoder node shows no new
failures.

I cannot test the VEPU2 or the STM32MP25 VENC. The VEPU2 gets patches 2
and 3, but its interrupt handler is unchanged; Nicolas offered to test
the VEPU2 part of patch 2. The STM32MP25 VENC runs the H1 code of patch
2 and gets patch 3, but not the stop of patch 1.

The bugs were found and the patches drafted with an LLM coding
assistant while porting mainline Linux to an RK3026 board.

---
Changes in v3:
- Move the LLM and test notes below the --- line and add an
  Assisted-by: tag (Nicolas).
- 1/3: add Nicolas's Reviewed-by.
- 2/3: program the VEPU2 JPEG encoder's limit in 64-bit words as well;
  Nicolas offered to test it. Subject says "JPEG encoder", not "H1".
- 3/3: move the header + 64 floor out of hantro_try_fmt() into a new
  min_size field of struct hantro_fmt, set in the JPEG encoder formats
  of the Rockchip and STM32MP25 variants (Nicolas).
- Rebase on media next aa0f4c41d487.
- Link to v2: https://lore.kernel.org/all/20261110-hantro-buflimit-v2-0-ff7790def9fc@gmail.com/

Changes in v2:
- Trim the commit messages and code comments (Nicolas).
- 1/3: clear only the enable bit of H1_REG_ENC_CTRL instead of writing
  0 to the register, and add a rate-limited warning per fault bit, as
  hantro_g2_irq() does; add the H1_REG_INTERRUPT_* fault bits (Nicolas).
- 3/3: keep max(): it is a floor of header + one burst, the 64-byte
  rounding is on the stream limit in 2/3 (Nicolas).
- Move the test numbers from the commit messages to this cover letter.
- Link to v1: https://lore.kernel.org/r/20261109-hantro-buflimit-v1-0-f0b86ce61e66@gmail.com

---
Sergei Khomenkov (3):
      media: verisilicon: stop the VEPU1 JPEG encoder after an unfinished frame
      media: verisilicon: program the JPEG encoder stream limit in 64-bit words
      media: verisilicon: leave room for the JPEG header and one stream burst

 drivers/media/platform/verisilicon/hantro.h           |  2 ++
 .../media/platform/verisilicon/hantro_h1_jpeg_enc.c   |  4 +++-
 drivers/media/platform/verisilicon/hantro_h1_regs.h   |  4 ++++
 drivers/media/platform/verisilicon/hantro_v4l2.c      |  3 +++
 .../platform/verisilicon/rockchip_vpu2_hw_jpeg_enc.c  |  4 +++-
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c  | 19 +++++++++++++++++++
 drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c |  1 +
 7 files changed, 35 insertions(+), 2 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261106-hantro-buflimit-055e8029be23

Best regards,
-- 
Sergei Khomenkov <shomenkow@gmail.com>



