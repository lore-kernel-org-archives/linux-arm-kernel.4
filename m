Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843A606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1wCvyd8I;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mLVPsrdk;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GUrqJISE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RCIqtdfhG8B4mEvDXMbG41Q4fIpuEUuHx+jbF84Oi+s=; b=1wCvyd8IWBErHw
	KJvqP9UHVNlnhnlcC5q+9hqyT0vNM0hztG+U4qDRzQ0yrol9jtdRM5aBlekAzJgpvlUB+HoRNq31p
	Ohof2PfO58BXFmA+9VdlovQXL1cKI4SzamQhTfXHE4HH4LK+7tZVpmgPQP62/uBYSNPbHGsVW98Xv
	N1UrQOmg2xrhjRlI+H86vDq/jlAtMeNFVcsIwVKBOXq849EjvGM3grCBVQ7chypapv7zTiayKE+du
	spFaZy3RX8bQ6CEhhf1yHkeEwCprbwUZNpEhVGdh3Nz6jgEl6tAmPlKIH6saVK1mH0IbY4fw7jPXX
	AMyGKSrw27I6Rc8N5xeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu3L-00000007I9H-0pRY;
	Tue, 24 Nov 2026 17:11:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu1A-00000007H4k-2776
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 17:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RCIqtdfhG8B4mEvDXMbG41Q4fIpuEUuHx+jbF84Oi+s=; b=mLVPsrdkjK0bgEptPklSxfoBkC
	UTx4cIO/CT5tgV/uMIF6B8ELBJAYGcYcCjczVZxdEbdTGc8PhpvR3P/ZEjJwrkjDBKtK/ozqrmyiO
	cAC/IVBx5PA1nG38hsh8d6HS9gJXQpXT1XEzfa4mqjO6q5x0pqFtaSIsYscBRTzjkZabRoHfS6ryo
	3NQjyg48PiU1rtQSn61c2aUHkkaxTY8kvnGPMkwe0IpQq7+gwRx/pbFwve9VMoJjnRn9uuEtBjDCA
	2+/2PdIBYbqXGnE9FCZ8QGBfKlzYcS1aKBBPRLM79Eh1SUfacQP2OSXf9RyoZuMKvgskDXW1KQoLC
	D2nWzTOw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu17-00000004NuW-1hoE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:09:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79ABD1C01;
	Tue, 24 Nov 2026 09:09:10 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EE103F763;
	Tue, 24 Nov 2026 09:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540153; bh=Kz+RKl+YgJmmeJvO2/FK70I8/injjAKZ41cPhevY7f0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GUrqJISE9vYNkR+56KCjJSaJnePdT9tF46C2pKTA60uvnvx6Sx9Ar7zNIOt5GbPY8
	 JMRJRbevDteRWHILBvkbETstfFN8cx3E7P/X/Y3UZ7YmtUNur+9enmvt7rlid4HBzs
	 80vNEttNlRS/JS/Kp8nZz4LH4uxqgW3caqy1CS3I=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:51 +0000
Subject: [PATCH 23/24] media: Documentation: Document Mali-C720 parameter
 settings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-23-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=13203;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=ui+iKncklIbw+x1yGWS4x+f9wDQSeGVIk7kFDK1FDnQ=;
 b=mBJXUw+LLxoiGFOF7bHgaDLQ4BrxPh2W8BroMGOr/XHJSBayS4EQJ4TZU0pe6ZoJHq5T4HBvG
 nZH9QID3TcGB1YUVOf5whHENzz2uN3DZWg/AzdpiDA6ICoMa2w6xYJg
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_170917_789915_6E7695B7 
X-CRM114-Status: GOOD (  20.28  )
X-Spam-Score: -2.5 (--)
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

Document ISP parameter configuration and querying supported parameter
blocks through the capability control. Describe the parameter buffer
layout and provide an example of populating the configuration blocks.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../admin-guide/media/mali-c720-graph.dot          |  4 +-
 Documentation/admin-guide/media/mali-c720.rst      | 46 ++++++++++---
 .../userspace-api/media/drivers/mali-c720.rst      | 14 ++--
 .../media/v4l/metafmt-arm-mali-c720.rst            | 78 +++++++++++++++++++++-
 4 files changed, 125 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/media/mali-c720-graph.dot b/Documentation/admin-guide/media/mali-c720-graph.dot
index c3594c525370734cca4acfb6e1bf03834b611029..92e98e405c440a136f98c230b8e1fa76fb2d6e06 100644
--- a/Documentation/admin-guide/media/mali-c720-graph.dot
+++ b/Documentation/admin-guide/media/mali-c720-graph.dot
@@ -6,7 +6,7 @@ digraph board {
         n00000003:port0 -> n00000009:port1 [style=dashed]
         n00000009 [label="{{<port1> 1} | mali-c720 input\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000009:port0 -> n0000000c:port0
-        n0000000c [label="{{<port0> 0} | mali-c720 isp\n/dev/v4l-subdev3 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000000c [label="{{<port0> 0 | <port3> 3} | mali-c720 isp\n/dev/v4l-subdev3 | {<port1> 1 | <port2> 2}}", shape=Mrecord, style=filled, fillcolor=green]
         n0000000c:port1 -> n00000014:port0
         n0000000c:port2 -> n0000006c [style=dashed]
         n00000014 [label="{{<port0> 0} | mali-c720 hv pipe\n/dev/v4l-subdev4 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
@@ -17,6 +17,8 @@ digraph board {
         n00000038 [label="mali-c720 fr0-rgb\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
         n0000003c [label="mali-c720 fr0-yuv\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
         n0000006c [label="mali-c720 3a stats\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+        n00000070 [label="mali-c720 3a params\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+        n00000070 -> n0000000c:port3 [style=dashed]
         n00000074 [label="{{<port0> 0} | csi2-rx\n/dev/v4l-subdev6 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
         n00000074:port1 -> n00000009:port1
         n00000079 [label="{{} | imx415 1-001a\n/dev/v4l-subdev7 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
diff --git a/Documentation/admin-guide/media/mali-c720.rst b/Documentation/admin-guide/media/mali-c720.rst
index 06b97e11ee380df55d13b11706527687bb3c74e6..0008577a23af392bcf40661f417238be3df55b43 100644
--- a/Documentation/admin-guide/media/mali-c720.rst
+++ b/Documentation/admin-guide/media/mali-c720.rst
@@ -126,10 +126,11 @@ The driver has up to six V4L2 subdevices:
 - ``mali-c720 hv pipe``: Human vision pipeline.
 - ``mali-c720 fr 0 pipe``: Full-resolution crop/scale pipeline.
 
-The driver has three V4L2 video devices:
+The driver has four V4L2 video devices:
 
 - ``mali-c720 fr0-rgb`` and ``mali-c720 fr0-yuv``: FR capture devices.
 - ``mali-c720 3a stats``: 3A statistics capture device.
+- ``mali-c720 3a params``: 3A parameters output device.
 
 Input formats
 -------------
@@ -348,6 +349,32 @@ their respective pipelines are present. We expose a V4L2 control
 :ref:`V4L2_CID_MALI_C720_STATS_CAPABILITIES <mali-c720-controls>` which allows
 the userspace to query the statistics produced by the ISP.
 
+.. _mali-c720-3a-params:
+
+Programming ISP Parameters
+==========================
+
+The ISP can be programmed with various parameters from userspace to apply to
+the hardware before and during video streaming. This allows userspace to
+dynamically change values such as black level, white balance, digital gain
+and so on.
+
+Enable the parameters link before starting capture:
+
+.. code-block:: none
+
+    media-ctl -l "'mali-c720 3a params':0->'mali-c720 isp':3[1]"
+
+The buffer format and how to populate it are described by the
+:ref:`V4L2_META_FMT_MALI_C720_PARAMS <v4l2-meta-fmt-mali-c720-params>` format,
+which should be set as the data format for the `mali-c720 3a params` video node.
+
+Similar to statistics, our configurable hardware means that the modules present
+in the ISP can vary depending on its configuration. As such, we expose a V4L2
+control :ref:`V4L2_CID_MALI_C720_PARAM_CAPABILITIES <mali-c720-controls>`
+which allows the userspace to query the supported parameter blocks. The
+parameter buffer will be invalidated if any provided blocks are not present.
+
 .. _mali-c720-frame-scheduling:
 
 Frame scheduling and Media Requests
@@ -359,13 +386,14 @@ direct buffer queuing or Media Requests. Use of Media Requests is optional.
 Direct mode
 -----------
 
-When all streaming statistics and image capture queues use direct buffer
-queuing through :ref:`VIDIOC_QBUF`, the driver schedules frames in
+When all streaming parameter, statistics and image capture queues use direct
+buffer queuing through :ref:`VIDIOC_QBUF`, the driver schedules frames in
 free-running mode. Scheduling starts only when at least one image or
 statistics output buffer is ready. Once started, it continues scheduling
-frames using the available buffers.
+frames using the available buffers and the latest applied parameters.
 Empty statistics or image capture queues disable their respective capture
-for the scheduled frame.
+for the scheduled frame, and an empty parameters queue leaves the ISP
+configuration unchanged.
 
 Request mode
 ------------
@@ -376,7 +404,7 @@ request.
 
 Applications allocate a request using :ref:`MEDIA_IOC_REQUEST_ALLOC` on the
 media device.
-Statistics and image buffers are associated with it through
+Parameter, statistics and image buffers are associated with it through
 :ref:`VIDIOC_QBUF`, setting ``V4L2_BUF_FLAG_REQUEST_FD`` and ``request_fd``.
 The request is then submitted using :ref:`MEDIA_REQUEST_IOC_QUEUE` on the
 request file descriptor.
@@ -389,9 +417,9 @@ Queues without a buffer will be disabled for the scheduled frame.
 
 All buffers associated with the request are usually applied on the same
 frame, but a request could span multiple frames if multiple buffers are
-queued for the same buffer queue.
-The statistics and image buffers are filled with the results from that
-frame. Completed buffers are returned to userspace through
+queued for the same buffer queue. The parameters are applied before
+processing, and the statistics and image buffers are filled with the results
+from that frame. Completed buffers are returned to userspace through
 :ref:`VIDIOC_DQBUF <VIDIOC_QBUF>`.
 
 It is permitted to queue buffers directly in other VB2 queues alongside
diff --git a/Documentation/userspace-api/media/drivers/mali-c720.rst b/Documentation/userspace-api/media/drivers/mali-c720.rst
index 306112582cd62b5c7131d8e7d8bab7ecae9f2eee..9aa3107cbb67ad3e92f5a8452bfddd663ad60d5c 100644
--- a/Documentation/userspace-api/media/drivers/mali-c720.rst
+++ b/Documentation/userspace-api/media/drivers/mali-c720.rst
@@ -5,15 +5,19 @@
 Arm Mali-C720 ISP driver
 ========================
 
-The Arm Mali-C720 ISP driver implements the following driver-specific control:
+The Arm Mali-C720 ISP driver implements two driver-specific controls:
+
+``V4L2_CID_MALI_C720_PARAM_CAPABILITIES (__u16 array)``
+    Lists the parameter block types accepted by the ISP. Each element is a
+    value from :c:type:`mali_c720_param_block_type`.
 
 ``V4L2_CID_MALI_C720_STATS_CAPABILITIES (__u16 array)``
     Lists the statistics block types supported by the ISP. Each element is a
     value from :c:type:`mali_c720_stats_type`.
 
-The Mali-C720 ISP can be configured to include or exclude statistics blocks.
-This control allows the driver to communicate to userspace which statistics
-block types are supported by the driver and present in the hardware.
+The Mali-C720 ISP can be configured to include or exclude processing and
+statistics blocks. These controls allow the driver to communicate to userspace
+which block types are supported by the driver and present in the hardware.
 
 Format enumeration
 ------------------
@@ -31,6 +35,8 @@ Buffer alignment
 
 Image capture buffers require DMA base addresses aligned to 32 bytes.
 Statistics capture buffers require DMA base addresses aligned to 16 bytes.
+Parameter buffers have no additional hardware DMA address alignment
+requirement.
 
 Buffers allocated by the driver using MMAP satisfy these requirements
 automatically. Imported DMA-BUFs must provide suitable alignment.
diff --git a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
index 1d19183cc07a81dfc95682c701a5bfc5f953a93a..0c2a427da23a7be23ca87f6b8f3d9a76d2e746af 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-arm-mali-c720.rst
@@ -1,13 +1,15 @@
 .. SPDX-License-Identifier: GPL-2.0
 
+.. _v4l2-meta-fmt-mali-c720-params:
 .. _v4l2-meta-fmt-mali-c720-stats:
 
 *******************************************************************************
-V4L2_META_FMT_MALI_C720_STATS ('C72S')
+V4L2_META_FMT_MALI_C720_STATS ('C72S'), V4L2_META_FMT_MALI_C720_PARAMS ('C72P')
 *******************************************************************************
 
-For details on queueing statistics buffers and synchronizing them with
-image buffers using Media Requests, see :ref:`mali-c720-frame-scheduling`.
+For details on queueing statistics and parameter buffers and synchronizing
+them with image buffers using Media Requests, see
+:ref:`mali-c720-frame-scheduling`.
 
 3A Statistics
 =============
@@ -34,6 +36,76 @@ capability control
 For details of the statistics, see the statistics blocks defined in
 ``mali-c720-config.h``.
 
+Configuration Parameters
+========================
+
+The configuration parameters are passed to the :ref:`mali-c720 3a params
+<mali-c720-3a-params>` metadata output video node, using the
+:c:type:`v4l2_meta_format` interface. Parameters for the Mali-C720 use the
+:ref:`generic V4L2 ISP format <v4l2-isp>`, through which groups of parameters
+are defined as distinct structures or blocks in the ``data`` member of
+:c:type:`v4l2_isp_buffer`. Userspace is responsible for populating the data
+member with the blocks that need to be configured by the driver. It is also
+responsible for clearing the parameter buffer before writing new parameters.
+Each block-specific structure embeds :c:type:`v4l2_isp_block_header` as its
+first member and userspace must populate the ``type`` member with a value from
+:c:type:`mali_c720_param_block_type`, provided that type is supported based
+on querying the parameters capability control
+:ref:`V4L2_CID_MALI_C720_PARAM_CAPABILITIES <mali-c720-controls>`.
+
+Each block-specific structure embeds an ``updated_mask``. The corresponding
+``mali_c720_params_*_mask`` enum defines bit positions: set ``1ULL << value``
+for each field or group of fields to update. Other fields retain their previous
+configuration.
+
+.. code-block:: c
+
+    struct v4l2_isp_buffer *params =
+            (struct v4l2_isp_buffer *)buffer;
+
+    memset(buffer, 0, buffer_size);
+
+    params->version = V4L2_ISP_VERSION_V1;
+    params->data_size = 0;
+
+    void *data = (void *)params->data;
+
+    struct mali_c720_params_awb_gains *gains =
+            (struct mali_c720_params_awb_gains *)data;
+
+    gains->header.type = MALI_C720_PARAM_BLOCK_AWB_GAINS_HV;
+    gains->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+    gains->header.size = sizeof(struct mali_c720_params_awb_gains);
+
+    gains->gain00 = 256;
+    gains->gain01 = 256;
+    gains->gain10 = 256;
+    gains->gain11 = 256;
+
+    gains->updated_mask =
+        (1ULL << MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN00) |
+        (1ULL << MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN01) |
+        (1ULL << MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN10) |
+        (1ULL << MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN11);
+
+    data += sizeof(struct mali_c720_params_awb_gains);
+    params->data_size += sizeof(struct mali_c720_params_awb_gains);
+
+    struct mali_c720_params_digital_gain *gain =
+            (struct mali_c720_params_digital_gain *)data;
+
+    gain->header.type = MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP;
+    gain->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+    gain->header.size = sizeof(struct mali_c720_params_digital_gain);
+
+    gain->gain = 512; // 2x gain
+    gain->offset = 51200; // Black level offset
+    gain->updated_mask =
+        (1ULL << MALI_C720_PARAMS_DIGITAL_GAIN_MASK_GAIN) |
+        (1ULL << MALI_C720_PARAMS_DIGITAL_GAIN_MASK_OFFSET);
+
+    params->data_size += sizeof(struct mali_c720_params_digital_gain);
+
 Arm Mali-C720 uAPI data types
 =============================
 

-- 
2.55.0


