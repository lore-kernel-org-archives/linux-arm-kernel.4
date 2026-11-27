Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19777606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nuc0GPhb;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qFinFgku
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/6ySv6RdxKdr3noRcdszgoEt5PV0BwNSBjkJVpTOjeU=; b=Nuc0GPhb1ZJezcYhejXMWDRZpj
	4YDTskqotA8q7g2gaRQIsp8lKD5+XpuTJ6n/lYVM35KpdXbEDOJ22FVZWkMhgvo+blZNdtLhrTekT
	RVGGm9lJEJRBOXPNk1T0yD3Q3ToefQkJf634u/j3jioKHmL1sANjkmzVtb419aaP2BJygo7DmzTfT
	jB1U3QlDn8u+5wCeOiYWPMIsqGbwpvZ6UBDof95n33hpgQOGslCKS0MmDdD/L40Wfauysgy8wFbWM
	/d0I0o6JXRFA4YXcccB7S8F1sBwKCuUVlUgC1ntzqDi6YbbHI3wo/iqCLetzPDl5leaKUDPlk/i9W
	5pNke3PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzYe-0000000HDuz-3Zyg;
	Fri, 27 Nov 2026 17:16:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzYW-0000000HDrv-0fe8;
	Fri, 27 Nov 2026 17:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795799773;
	bh=Br7d/EbtTMulCZaZxq3YC/liaH0efyOsf+b53eHwjkc=;
	h=From:Subject:Date:To:Cc:From;
	b=qFinFgkuYYSsiD4u53vG2Uf9KfX2AozTAapw8J6LzZqqY/14XvHm1at3WYvYY/E/E
	 1AGZH7bctkZJyalXkSULe7R33miLQmC22Ku19XHQm9p1gWt7JYgsZhhQA9pukmKLlm
	 vZ4433dIfVATPmFMdXlouwMYAVie0coX13xGlLCikeGt49Rc7g9NQRJqNr2f+GRwF+
	 lM51YsQgVmmOiS9R6fF8H5nMQp6hO7Xi3WbK0M3JftOQh0f1kGwsumyde40APbekRv
	 uLU/s6NF87sYx4iAclJ5Z3XhXKqsgDk2NAYN65NZQqXXdxfd7xyqRgP8jbWCD29iYb
	 5pnlW6DtDgtDw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34E9217E0183;
	Fri, 27 Nov 2026 18:16:12 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v2 0/4] media: Track v4l2 buffers through an allocator
Date: Fri, 27 Nov 2026 12:16:09 -0500
Message-Id: <20261127-v4l2-add-mem-tracker-v2-0-73b0494260e7@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PwW7DIAwG4FeJOI+JUEIgp71H1YNjzMqWlA7Sa
 FOVdx+hk3rZ8Zdsf7/vLFMKlNnQ3FmiNeQQLyXIl4bhGS7vxIMrmUkhtdCt5KuaJAfn+EwzXxL
 gJyXuQAhjsFegFSur10Q+fNezx9Mj59v4Qbjst/4mEn3dirc8xp5c0SsmzBPzu0QcCDX1XgvQO
 KyVGiETxzjPYRka43pP1pgOtfRowXaj7zpn3SiVclb3EgyAQ7aXOoe8xPRTX1/b2qHCttX/f7m
 2XHArhAfV0YE0vGGcJhhjgtfSgJ22bfsF3x11A1EBAAA=
X-Change-ID: 20260612-v4l2-add-mem-tracker-da0088c74a64
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_091617_014405_A61F4E72 
X-CRM114-Status: GOOD (  19.26  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

Currently, the only way to track buffers allocated by v4l2 from usespace
is to use the subsystem available debug information (e.g.:
/sys/kernel/debug/dma_buf/bufinfo).
But that information is generic and cannot be matched to a v4l2 driver or
to a userspace application: It is merely information about the allocation.

Other types of allocations require the developper to find where they are
exposed and how to link them to their test.

This can become hard to track when mutliple drivers are working at the
same time.

To improve that, add a small wrapper around buffer allocations to keep
track of them at the video device level so that we can add debug
information to them like a name, userspace pid/fd that did the
allocation,... and expose them to userspace via a debugfs entry.

It currently only supports DMA buffer allocations and adds support for
VB2 allocations too.
Other kind of memory tracking can be added later.
The verisilicon and rkvdec drivers have been ported to use the tracked
dma alloactions.

Note that this depends on the ftrace support patch series[1] that
provides fd/pid info in the v4l2_fh struct.
That series is a bit old, so this is based on an older linux version, but
that only changes things for the last 2 commits.

A v4l2top utility[2] has been made, to be used in parallel with the
fdinfo patch series[3], to show the list of active streams with their HW
and memory usage.

With this, debugfs looks like this when decoding a HEVC 1080p stream with
rkvdec on rk3588:

  root # cat /sys/kernel/debug/v4l2/fdc38100.video-codec/mem 
  created-by                      fd              pid             size            label
  -------------------------------------------------------------------------------------
  gst-launch-1.0                  7               635             39184           vdpu381-hevc-priv-tbl
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-7
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-6
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-5
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-4
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-3
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-2
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-1
  gst-launch-1.0                  7               635             4177920         cap-00000000ac34392e-0
  gst-launch-1.0                  7               635             3133440         out-000000005c0230f6-1
  gst-launch-1.0                  7               635             3133440         out-000000005c0230f6-0
  =====================================================================================
  Total size: 39729424

[1]: https://lore.kernel.org/all/20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com/
[2]: https://github.com/cazou/v4l2top/tree/upstream
[3]: https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com/

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v2:
- Use the already created v4l2 debugfs directory.
- Link to v1: https://patch.msgid.link/20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com

To: Tomasz Figa <tfiga@chromium.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org

---
Detlev Casanova (4):
      media: Add a v4l2 memory allocations tracker
      media: Store v4l2_fh in the vb_queue
      media: verisilicon: Switch to tracked dma allocations
      media: rkvdec: Switch to tracked dma allocations

 .../media/common/videobuf2/videobuf2-dma-contig.c  |  27 ++-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   |  14 +-
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  14 +-
 .../media/platform/rockchip/rkvdec/rkvdec-rcb.c    |  21 ++-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c |  14 +-
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c |  14 +-
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  33 ++--
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   4 +
 drivers/media/platform/verisilicon/hantro.h        |   1 +
 drivers/media/platform/verisilicon/hantro_drv.c    |   4 +
 drivers/media/platform/verisilicon/hantro_h264.c   |   7 +-
 drivers/media/platform/verisilicon/hantro_hevc.c   | 100 ++++++-----
 drivers/media/platform/verisilicon/hantro_mpeg2.c  |  16 +-
 .../media/platform/verisilicon/hantro_postproc.c   |  14 +-
 drivers/media/platform/verisilicon/hantro_vp8.c    |  25 +--
 drivers/media/platform/verisilicon/hantro_vp9.c    |  34 +++-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c       | 160 +++++++++++-------
 drivers/media/v4l2-core/Makefile                   |   1 +
 drivers/media/v4l2-core/v4l2-allocator.c           | 187 +++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-device.c              |   4 +-
 include/media/v4l2-allocator.h                     |  26 +++
 include/media/v4l2-device.h                        |   3 +
 include/media/videobuf2-core.h                     |   5 +
 25 files changed, 559 insertions(+), 197 deletions(-)
---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20260612-v4l2-add-mem-tracker-da0088c74a64
prerequisite-change-id: 20260608-v4l2-add-ftrace-aec6e7f60a6c:v4
prerequisite-patch-id: 1642377e7eb8e2b9c08ba2edfe1627f246d18dec
prerequisite-patch-id: cbb31b868fe441e12390ed4f722c66a09d5da018
prerequisite-patch-id: 9f311d567e9c362b5ed00330e5d6cc6de9c94118
prerequisite-patch-id: fe7cd355f47da859fb1384cb02285f01ea230d35
prerequisite-patch-id: a92d7089a6ddef832e764a958d83e0402f6d83f3
prerequisite-patch-id: a9d89bb00db27935b66419eb3e6b225ef9381fe6
prerequisite-patch-id: 4bec038b584ae24fe4127164998ff81e30fe14d6
prerequisite-patch-id: 662455e7c49a81f89759dd6b576650d7803015d3
prerequisite-patch-id: 088f331d5bc7ce94e392ec07d954838ee294aefa

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


