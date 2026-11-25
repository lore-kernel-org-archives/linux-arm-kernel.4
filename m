Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E3C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qr551WIr;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Yu48+IuB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G0TYUpJg36o+7nLbbA7hJOngSeOqnT9Tjext4wkdPLo=; b=qr551WIr/0ETbJ
	ucnt+wiMb+Dprq5mvRMbhBRohw1ihspM+xmjT7DiG05mxMmeGOfrgVoIDGORwJvYPoocARJPvi1FE
	9fSUP0YqWozd4HzkH16N+GQX5AGNzszPPWZ60/UjVDpIqqN/hWD0Cf+5Px27UoMJ9c/1GsJ17a7sT
	C2zUTl5tP4GmMjgutbl+I+TPD6GIrSX38a409HOQXTcODPwaDGZBRyIvEZW+Ergz4CNkCw3oLuCuA
	vDZF3dHObc5q7FgNQWpj8HNTZ9EwoeMvwSr1DDL+EKrlxWSFoqixy99PpT5uFEV9+Di9s0S4od9Ir
	8x+M6/xv6asISfZlx8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEhk-0000000AJAy-1dDl;
	Wed, 25 Nov 2026 15:14:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEhR-0000000AJ1k-107U;
	Wed, 25 Nov 2026 15:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795619659;
	bh=rCpXDMQPfFzoGIsLhtfBC28BG6dh8sM5ocD3/j2uLeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yu48+IuBOdp1M5jbLyx3bXM65dLBZy0VNh3grrsR5SR59Hf8ilFhJFoxKxVIFkaFh
	 6SI38Kao7mliUQs9/gXHpApsupzSj7fIi+mmzKDrCeST4JR7o9dJ0qS5ShubRvX99K
	 TOdwhuPX4rqA6zJswCKquUkKUo1A39Xyoyx9Klms6o4CnRS6y+G+aN9KhSqRK1qnlz
	 m+j9pVbdqB2HoprRVs1bBUVt7ktopIsjzSoEC5WvBBnPhKQPvolOiwIxgsU4iwWSQg
	 pXTLUnzr8zcdzHSDjRjhxgrBxZNOhctfvpJyfgrKDDliz/5u4lSh1pgrea+mtrMNOv
	 0WCRalx7unHWw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FA7B17E1090;
	Wed, 25 Nov 2026 16:14:17 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 25 Nov 2026 10:11:59 -0500
Subject: [PATCH v4 2/5] docs: media: add documentation for V4L2 driver
 usage metrics
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-v4l2-add-fdinfo-v4-2-2dc73fad9932@collabora.com>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_071421_661430_E43F6A65 
X-CRM114-Status: GOOD (  24.79  )
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

From: Christopher Healy <healych@amazon.com>

Document the V4L2 fdinfo interface for per-file-descriptor usage
metrics exposed by V4L2 drivers via /proc/<pid>/fdinfo/<fd>.

The interface is defined generically for V4L2 drivers, with a set of
mandatory keys ("v4l2-driver", "v4l2-driver-type") that identify the
driver and its type, and per-driver-type sections describing
additional keys. This leaves room to extend the interface to other
driver types (stateful codecs, capture devices, ISPs, ...) later
without breaking existing users.

The initial per-type section targets stateless (request API based)
codec devices, both decoders and encoders. With stateless codecs the
kernel driver explicitly submits each frame to the hardware and
receives a completion interrupt, providing a clean per-job metrics
update.

The specification defines "v4l2-" prefixed keys for per-core engine
utilization time and operating frequency, following the same
conventions as the DRM fdinfo mechanism documented in
drm-usage-stats.rst.

"v4l2-core-usage-cycles-<core_id>" is added as an optional key for HW
cycle counters, when supported.

Also provide ABI documentation, currently as testing.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129 +++++++++++++++++++
 .../userspace-api/media/drivers/index.rst          |   1 +
 .../media/drivers/v4l2-usage-metrics.rst           | 137 +++++++++++++++++++++
 3 files changed, 267 insertions(+)

diff --git a/Documentation/ABI/testing/procfs-fdinfo-v4l2 b/Documentation/ABI/testing/procfs-fdinfo-v4l2
new file mode 100644
index 000000000000..7c64403b6814
--- /dev/null
+++ b/Documentation/ABI/testing/procfs-fdinfo-v4l2
@@ -0,0 +1,129 @@
+What:		/proc/<pid>/fdinfo/<fd> (V4L2 device file descriptors)
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Per-file-descriptor usage metrics for V4L2 devices, exposed
+		as a set of "key:\tvalue\n" lines in the fdinfo file
+		associated with an open /dev/video<N> file descriptor.
+
+		All standardised keys are prefixed with "v4l2-". Driver
+		specific keys are prefixed with "<driver_name>-".
+
+		Counter values are cumulative since the file descriptor was
+		created and strictly monotonically increasing.
+
+		See Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst
+		for the full specification.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-driver
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		String. Name of the V4L2 driver backing this file descriptor.
+
+		Format:
+		  v4l2-driver:\t<name>\n
+
+		Mandatory for every driver that implements this interface.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-driver-type
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		String. Type of V4L2 device exposed through this file
+		descriptor. Tells userspace which additional type-specific
+		keys to expect.
+
+		Format:
+		  v4l2-driver-type:\t<type>\n
+
+		Standard values currently defined:
+		  - "stateless-decoder"
+		  - "stateless-encoder"
+
+		Additional values will be defined as the interface is
+		extended to other driver types.
+
+		Mandatory for every driver that implements this interface.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-core-usage-time-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer, in nanoseconds. Time the hardware core
+		identified by <core_id> spent busy processing work belonging
+		to this file descriptor, cumulative since the file descriptor
+		was created.
+
+		<core_id> must be a non-negative decimal integer (0, 1, 2,
+		...). Strings or other non-numeric identifiers are not
+		allowed.
+
+		Format:
+		  v4l2-core-usage-time-<core_id>:\t<uint> ns\n
+
+		Time is measured by the driver, typically from just before
+		the hardware is started to just after the completion
+		interrupt is handled, so it is slightly less precise than a
+		hardware cycle counter but is always available.
+
+		Mandatory for stateless-decoder and stateless-encoder driver
+		types.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-core-usage-cycles-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer. Number of hardware clock cycles the core
+		identified by <core_id> spent busy processing work belonging
+		to this file descriptor, cumulative since the file descriptor
+		was created.
+
+		<core_id> must be a non-negative decimal integer.
+
+		Format:
+		  v4l2-core-usage-cycles-<core_id>:\t<uint>\n
+
+		More precise than v4l2-core-usage-time-<core_id>, but
+		requires the hardware to expose a cycle counter. When
+		available together with v4l2-maxfreq-<core_id> and
+		v4l2-curfreq-<core_id>, userspace can derive an accurate
+		utilization percentage. Otherwise, userspace should fall back
+		to v4l2-core-usage-time-<core_id>.
+
+		Optional.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-maxfreq-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer, in Hz. Maximum operating frequency of the
+		main clock of the core identified by <core_id>.
+
+		<core_id> must be a non-negative decimal integer.
+
+		Format:
+		  v4l2-maxfreq-<core_id>:\t<uint> Hz\n
+
+		A core may have several clocks associated with it, but only
+		the one that actually clocks the hardware processing engine
+		of the core (its "main clock") is reported.
+
+What:		/proc/<pid>/fdinfo/<fd>: v4l2-curfreq-<core_id>
+Date:		July 2026
+Contact:	Detlev Casanova <detlev.casanova@collabora.com>
+		linux-media@vger.kernel.org
+Description:
+		Unsigned integer, in Hz. Current operating frequency of the
+		main clock of the core identified by <core_id>.
+
+		<core_id> must be a non-negative decimal integer.
+
+		Format:
+		  v4l2-curfreq-<core_id>:\t<uint> Hz\n
diff --git a/Documentation/userspace-api/media/drivers/index.rst b/Documentation/userspace-api/media/drivers/index.rst
index 8d2c489b8453..88442a806ad8 100644
--- a/Documentation/userspace-api/media/drivers/index.rst
+++ b/Documentation/userspace-api/media/drivers/index.rst
@@ -35,6 +35,7 @@ For more details see the file COPYING in the source distribution of Linux.
 	imx-uapi
 	mali-c55
 	max2175
+	v4l2-usage-metrics
 	npcm-video
 	omap3isp-uapi
 	thp7312
diff --git a/Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst b/Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst
new file mode 100644
index 000000000000..c56b1d608cd4
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/v4l2-usage-metrics.rst
@@ -0,0 +1,137 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _v4l2-usage-metrics:
+
+==========================
+V4L2 client usage metrics
+==========================
+
+V4L2 drivers can optionally expose per-file-descriptor usage metrics via
+``/proc/<pid>/fdinfo/<fd>``. This is analogous to the DRM fdinfo mechanism
+documented in :ref:`drm-client-usage-stats`, but uses the ``v4l2-`` key
+prefix for V4L2 devices.
+
+The interface is generic to V4L2: any driver type (stateless or stateful
+codecs, capture devices, ISPs, converters, ...) may implement it and provide
+the metrics relevant to its hardware. This document defines a common set of
+mandatory keys that identify the driver and the kind of device, plus per
+driver-type sections describing additional keys.
+
+The initial set of type-specific keys documented here targets stateless
+(request API based) codec devices, both decoders and encoders. With
+stateless codecs, the kernel driver explicitly submits each frame to the
+hardware and receives a completion interrupt, providing a clean per-job
+boundary that can be attributed to the submitting file descriptor. Other
+device types (stateful codecs, capture devices, ISPs, ...) can be added
+later with their own set of type-specific keys.
+
+Implementation
+==============
+
+The V4L2 core provides the plumbing: drivers implement the ``show_fdinfo``
+callback in ``struct v4l2_file_operations``, and the core wires it into the
+kernel ``struct file_operations`` so that ``/proc/<pid>/fdinfo/<fd>`` output
+includes the driver-provided keys.
+
+File format specification
+=========================
+
+- File shall contain one key value pair per one line of text.
+- Colon character (``:``) must be used to delimit keys and values.
+- All standardised keys shall be prefixed with ``v4l2-``.
+- Driver-specific keys shall be prefixed with ``driver_name-``.
+
+All counter values reported through this interface are cumulative since the
+file descriptor was created, and are strictly monotonically increasing.
+
+Mandatory keys
+==============
+
+The following keys must be exposed by every driver that implements this
+interface, regardless of the device type.
+
+- v4l2-driver: <valstr>
+
+  String shall contain the name of the V4L2 driver.
+
+- v4l2-driver-type: <valstr>
+
+  String shall identify the type of V4L2 device exposed through this file
+  descriptor. This key tells userspace which additional type-specific keys
+  to expect. Standard values currently defined are ``stateless-decoder``
+  and ``stateless-encoder``. Additional values will be defined as this
+  interface is extended to other driver types.
+
+Stateless codec keys
+====================
+
+The keys described in this section apply to file descriptors whose
+``v4l2-driver-type`` is ``stateless-decoder`` or ``stateless-encoder``.
+
+A stateless codec may be composed of one or more independent hardware
+cores. Per-core metrics are reported using keys suffixed with a
+``<core_id>`` identifier, so a single file descriptor can report metrics
+for multiple cores.
+
+``<core_id>`` must be a non-negative decimal integer (e.g. ``0``, ``1``,
+``2``, ...). Strings or other non-numeric identifiers are not allowed, so
+that userspace can reliably parse and enumerate cores.
+
+Utilization keys
+----------------
+
+- v4l2-core-usage-time-<core_id>: <uint> ns
+
+  Mandatory.
+
+  Time in nanoseconds that the hardware core identified by ``<core_id>``
+  spent busy processing work belonging to this file descriptor, cumulative
+  since the file descriptor was created.
+
+  Time is measured by the driver, typically from just before the hardware
+  is started to just after the completion interrupt is handled, so it is
+  slightly less precise than a hardware cycle counter but is always
+  available.
+
+- v4l2-core-usage-cycles-<core_id>: <uint>
+
+  Optional.
+
+  Number of hardware clock cycles that the core identified by ``<core_id>``
+  spent busy processing work belonging to this file descriptor, cumulative
+  since the file descriptor was created.
+
+  This is more precise than ``v4l2-core-usage-time-<core_id>`` but requires
+  the hardware to expose a cycle counter. When available together with
+  ``v4l2-maxfreq-<core_id>`` and ``v4l2-curfreq-<core_id>``, userspace can
+  derive an accurate utilization percentage. Otherwise, userspace should
+  fall back to ``v4l2-core-usage-time-<core_id>``.
+
+Frequency keys
+--------------
+
+- v4l2-maxfreq-<core_id>: <uint> Hz
+
+  Maximum operating frequency of the main clock of the core identified by
+  ``<core_id>``.
+
+- v4l2-curfreq-<core_id>: <uint> Hz
+
+  Current operating frequency of the main clock of the core identified by
+  ``<core_id>``.
+
+A core may have several clocks associated with it, but only the one that
+actually clocks the hardware processing engine of the core (its "main
+clock") should be reported through these keys.
+
+Example output
+==============
+
+::
+
+  v4l2-driver:                  hantro-vpu
+  v4l2-driver-type:             stateless-decoder
+  v4l2-core-usage-time-0:       123456789 ns
+  v4l2-core-usage-cycles-0:     74000000
+  v4l2-maxfreq-0:               600000000 Hz
+  v4l2-curfreq-0:               600000000 Hz

-- 
2.56.1


