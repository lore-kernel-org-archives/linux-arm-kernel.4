Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DD2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1LBWYwfG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RotUvxmS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H25AjgKZPzLpgycT/3Trb6lmYLRHfVvNdQa4Kt3f5Kw=; b=1LBWYwfGi6FojX
	u5H7/qXn+ntNcz22UI9+8z7h4eIXYZQ8bxDIeAeZ+H/CCMlrGVlLV8sgHfDD07CCXcH2dFdIzS7z9
	jNnr/6iFfUw++8i7G58ZXsp7A1UEFfrWLpx+kOGw09Uk8TbHAJDZ5Yam9bjBaMWFdk026PPwxTzKT
	ZmfEr3nle6I1Uv03dYUN8qKPyTVsOmjwqMl6Y6d3nCf5J1V860tsudF1ApjerEz/+UnqYb2E0UsAf
	qC4wLOKzzP25XpJzqMtzSDvOgNCjZid5GqYoNEB/JJXUuV8E69EAguWOGAfqyc6T10bRLv+l6WdId
	OqrZ0VWsaiD3DdM/Oxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu3K-00000007I7g-249g;
	Tue, 24 Nov 2026 17:11:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu0s-00000007GmX-0b0I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:09:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 467DB1BCB;
	Tue, 24 Nov 2026 09:08:58 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BB613F763;
	Tue, 24 Nov 2026 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540141; bh=XOtyagVUUz2O2YpBsjImieeB+XM04nUAx5GZaLBEVIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RotUvxmSIZTQAWFVwxbsKDvJjQwlF8jOkwjPbFNraS8dyhOPA+daABgnjbVeiP7q8
	 CBuESZGx++TeV4W6seLQmV10D8BrdBa/YlIFrEl1jbAVbLdv3bQ+bGe0Tv7qCJ5dYG
	 XQLRlwuZ5qlV+pJ6P8HbVvCN4SxnAxRJYgM43GZo=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:47 +0000
Subject: [PATCH 19/24] media: Documentation: Document Mali-C720 statistics
 capture
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-19-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Anthony McGivern <anthony.mcgivern@arm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Anthony McGivern <Anthony.McGivern@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=12876;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=VDd1NofbuwX2C96Ixwg5Pq5xdahJ8pA3YHILnxmO4ro=;
 b=KuX0UrCvWtSq9bypFKJS3aHFCbvx8tj7q5hjWMqXj7myUypAMFNJJ0AdxD5Npd62ni4aVUPGN
 XvM8VfZ/Z/kAURMxtLSLYNlooqxalcEKVhvCrEHIhZ7rf8iKroUh1gU
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090904_647343_A92FBBF6 
X-CRM114-Status: GOOD (  22.60  )
X-Spam-Score: -4.4 (----)
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

From: Anthony McGivern <Anthony.McGivern@arm.com>

Document statistics capture and querying available statistics blocks
through the capability control. Include a capture example and explain
how frame sequence numbers associate statistics with image buffers.

Describe the statistics metadata format, its use of the generic V4L2
ISP buffer layout and the Mali-C720 UAPI structures.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../admin-guide/media/mali-c720-graph.dot          |  4 +-
 Documentation/admin-guide/media/mali-c720.rst      | 55 ++++++++++++++++++----
 .../userspace-api/media/drivers/index.rst          |  1 +
 .../userspace-api/media/drivers/mali-c720.rst      | 41 ++++++++++++++++
 .../userspace-api/media/v4l/meta-formats.rst       |  1 +
 .../media/v4l/metafmt-arm-mali-c720.rst            | 40 ++++++++++++++++
 6 files changed, 132 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/media/mali-c720-graph.dot b/Documentation/admin-guide/media/mali-c720-graph.dot
index f1d481b98aebd6ab5424fb78331337f2d7479c1f..c3594c525370734cca4acfb6e1bf03834b611029 100644
--- a/Documentation/admin-guide/media/mali-c720-graph.dot
+++ b/Documentation/admin-guide/media/mali-c720-graph.dot
@@ -6,8 +6,9 @@ digraph board {
         n00000003:port0 -> n00000009:port1 [style=dashed]
         n00000009 [label="{{<port1> 1} | mali-c720 input\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000009:port0 -> n0000000c:port0
-        n0000000c [label="{{<port0> 0} | mali-c720 isp\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000000c [label="{{<port0> 0} | mali-c720 isp\n/dev/v4l-subdev3 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
         n0000000c:port1 -> n00000014:port0
+        n0000000c:port2 -> n0000006c [style=dashed]
         n00000014 [label="{{<port0> 0} | mali-c720 hv pipe\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000014:port1 -> n0000001c:port0
         n0000001c [label="{{<port0> 0} | mali-c720 fr 0 pipe\n/dev/v4l-subdev5 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
@@ -15,6 +16,7 @@ digraph board {
         n0000001c:port2 -> n0000003c [style=dashed]
         n00000038 [label="mali-c720 fr0-rgb\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
         n0000003c [label="mali-c720 fr0-yuv\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n0000006c [label="mali-c720 3a stats\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
         n00000074 [label="{{<port0> 0} | csi2-rx\n/dev/v4l-subdev6 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000074:port1 -> n00000009:port1
         n00000079 [label="{{} | imx415 1-001a\n/dev/v4l-subdev7 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
diff --git a/Documentation/admin-guide/media/mali-c720.rst b/Documentation/admin-guide/media/mali-c720.rst
index 3ff2cb3170f257748878e78b85366b6462f76ff2..06b97e11ee380df55d13b11706527687bb3c74e6 100644
--- a/Documentation/admin-guide/media/mali-c720.rst
+++ b/Documentation/admin-guide/media/mali-c720.rst
@@ -126,9 +126,10 @@ The driver has up to six V4L2 subdevices:
 - ``mali-c720 hv pipe``: Human vision pipeline.
 - ``mali-c720 fr 0 pipe``: Full-resolution crop/scale pipeline.
 
-The driver has two V4L2 video devices:
+The driver has three V4L2 video devices:
 
 - ``mali-c720 fr0-rgb`` and ``mali-c720 fr0-yuv``: FR capture devices.
+- ``mali-c720 3a stats``: 3A statistics capture device.
 
 Input formats
 -------------
@@ -314,6 +315,39 @@ then configure a capture format like NV12:
     media-ctl -l "'mali-c720 fr 0 pipe':2->'mali-c720 fr0-yuv':0[1]"
     yavta -f NV12 -s 1920x1080 -c10 /dev/video1
 
+.. _mali-c720-3a-stats:
+
+Capturing ISP Statistics
+========================
+
+The ISP is capable of producing statistics for consumption by image processing
+algorithms running in userspace. These statistics can be captured by queueing
+buffers to the `mali-c720 3a stats` V4L2 device whilst the ISP is streaming.
+
+Each successfully captured statistics buffer carries the processed frame's
+sequence number in its :c:type:`v4l2_buffer` ``sequence`` field. This matches
+the sequence number of image buffers produced from the same frame.
+
+Only the :ref:`V4L2_META_FMT_MALI_C720_STATS <v4l2-meta-fmt-mali-c720-stats>`
+format is supported, so no format-setting need be done:
+
+.. code-block:: none
+
+    # We assume the media graph has been configured to support RGB24 capture
+    # from the mali-c720 fr0-rgb V4L2 Device, which is at /dev/video0. The
+    # statistics V4L2 device is at /dev/video2. Run the capture processes
+    # concurrently so that both video devices start streaming:
+
+    media-ctl -l "'mali-c720 isp':2->'mali-c720 3a stats':0[1]"
+    yavta -f RGB24 -s 1920x1080 -c10 /dev/video0
+    yavta -c10 -F /dev/video2
+
+As our hardware is configurable, the modules present can vary depending upon
+its configuration. This means that certain statistics may only be present if
+their respective pipelines are present. We expose a V4L2 control
+:ref:`V4L2_CID_MALI_C720_STATS_CAPABILITIES <mali-c720-controls>` which allows
+the userspace to query the statistics produced by the ISP.
+
 .. _mali-c720-frame-scheduling:
 
 Frame scheduling and Media Requests
@@ -325,12 +359,13 @@ direct buffer queuing or Media Requests. Use of Media Requests is optional.
 Direct mode
 -----------
 
-When all streaming image capture queues use direct buffer queuing through
-:ref:`VIDIOC_QBUF`, the driver schedules frames in free-running mode.
-Scheduling starts only when at least one image output buffer is ready.
-Once started, it continues scheduling frames using the available buffers.
-Empty image capture queues disable their respective capture for the
-scheduled frame.
+When all streaming statistics and image capture queues use direct buffer
+queuing through :ref:`VIDIOC_QBUF`, the driver schedules frames in
+free-running mode. Scheduling starts only when at least one image or
+statistics output buffer is ready. Once started, it continues scheduling
+frames using the available buffers.
+Empty statistics or image capture queues disable their respective capture
+for the scheduled frame.
 
 Request mode
 ------------
@@ -341,7 +376,7 @@ request.
 
 Applications allocate a request using :ref:`MEDIA_IOC_REQUEST_ALLOC` on the
 media device.
-Image buffers are associated with it through
+Statistics and image buffers are associated with it through
 :ref:`VIDIOC_QBUF`, setting ``V4L2_BUF_FLAG_REQUEST_FD`` and ``request_fd``.
 The request is then submitted using :ref:`MEDIA_REQUEST_IOC_QUEUE` on the
 request file descriptor.
@@ -354,7 +389,9 @@ Queues without a buffer will be disabled for the scheduled frame.
 
 All buffers associated with the request are usually applied on the same
 frame, but a request could span multiple frames if multiple buffers are
-queued for the same buffer queue. Completed buffers are returned to userspace through
+queued for the same buffer queue.
+The statistics and image buffers are filled with the results from that
+frame. Completed buffers are returned to userspace through
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`.
 
 It is permitted to queue buffers directly in other VB2 queues alongside
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 8d2c489b8453e11b8e15ef9d9c1c0312f3da06af..ff93248d203d8b7109ff08d61a8e5121ce80c2a8 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -34,6 +34,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	dw100
 	imx-uapi
 	mali-c55
+	mali-c720
 	max2175
 	npcm-video
 	omap3isp-uapi
diff --git a/Documentation/userspace-api/media/drivers/mali-c720.rst b/Documentation/userspace-api/media/drivers/mali-c720.rst
new file mode 100644
index 0000000000000000000000000000000000000000..306112582cd62b5c7131d8e7d8bab7ecae9f2eee
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/mali-c720.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. _mali-c720-controls:
+
+Arm Mali-C720 ISP driver
+========================
+
+The Arm Mali-C720 ISP driver implements the following driver-specific control:
+
+``V4L2_CID_MALI_C720_STATS_CAPABILITIES (__u16 array)``
+    Lists the statistics block types supported by the ISP. Each element is a
+    value from :c:type:`mali_c720_stats_type`.
+
+The Mali-C720 ISP can be configured to include or exclude statistics blocks.
+This control allows the driver to communicate to userspace which statistics
+block types are supported by the driver and present in the hardware.
+
+Format enumeration
+------------------
+
+The available image formats depend on the output pipeline. For example, the
+``mali-c720 fr0-rgb`` capture device supports RGB formats, while the
+``mali-c720 fr0-yuv`` capture device supports YUV formats. Future hardware
+versions may also expose different supported formats. Applications must select
+an image format compatible with the media bus format configured on the connected
+subdevice's source pad. Applications should enumerate the formats supported by
+each video device using :ref:`VIDIOC_ENUM_FMT <VIDIOC_ENUM_FMT>`.
+
+Buffer alignment
+----------------
+
+Image capture buffers require DMA base addresses aligned to 32 bytes.
+Statistics capture buffers require DMA base addresses aligned to 16 bytes.
+
+Buffers allocated by the driver using MMAP satisfy these requirements
+automatically. Imported DMA-BUFs must provide suitable alignment.
+The driver rejects buffers whose DMA base addresses do not meet these
+requirements.
+
+Image strides must also be aligned to 32 bytes. Format negotiation adjusts
+``bytesperline`` accordingly, and applications must use the returned value.
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index b5455229837e707c24e134438d5e2fd12cb3bf37..6d4423155fd90a9557cd744e2fc010d3e283be0c 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interface only.
     :maxdepth: 1
 
     metafmt-arm-mali-c55
+    metafmt-arm-mali-c720
     metafmt-c3-isp
     metafmt-d4xx
     metafmt-generic
diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
new file mode 100644
index 0000000000000000000000000000000000000000..1d19183cc07a81dfc95682c701a5bfc5f953a93a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
@@ -0,0 +1,40 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-meta-fmt-mali-c720-stats:
+
+*******************************************************************************
+V4L2_META_FMT_MALI_C720_STATS ('C72S')
+*******************************************************************************
+
+For details on queueing statistics buffers and synchronizing them with
+image buffers using Media Requests, see :ref:`mali-c720-frame-scheduling`.
+
+3A Statistics
+=============
+
+The ISP collects statistics at different stages of frame processing. These
+may describe Bayer or processed image data, depending on the statistics
+block and its configuration. Userspace can obtain these statistics from the
+:ref:`mali-c720 3a stats <mali-c720-3a-stats>` metadata capture video node, using
+the :c:type:`v4l2_meta_format` interface.
+
+Userspace may consume these statistics in 3A algorithms, including
+auto-exposure, auto-white balance and autofocus, to compute adjustments to
+sensor and ISP settings.
+
+Statistics for the Mali-C720 use the :ref:`generic V4L2 ISP format <v4l2-isp>`.
+The buffer contains a :c:type:`v4l2_isp_buffer` header followed by statistics
+blocks in its ``data`` member. Each block embeds
+:c:type:`v4l2_isp_block_header` as its first member, with the ``type`` member
+set to a value from :c:type:`mali_c720_stats_type`. The available statistics
+depend on the hardware configuration. These can be queried via the statistics
+capability control
+:ref:`V4L2_CID_MALI_C720_STATS_CAPABILITIES <mali-c720-controls>`.
+
+For details of the statistics, see the statistics blocks defined in
+``mali-c720-config.h``.
+
+Arm Mali-C720 uAPI data types
+=============================
+
+.. kernel-doc:: include/uapi/linux/media/arm/mali-c720-config.h

-- 
2.55.0


