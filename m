Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973D8606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tsecEOaC;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IWocWBU/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n2AsLJvxNxcEbz6A8lvpKZadNpRU1qreceYOyZeai44=; b=tsecEOaCm/Uv0i
	5T0gqA8OLSvwD+IC8bKpHg6/w8Tt/hyeMs2oQgxnJmMvSVJ4dwwFg3AMAo2qeUPb0anFFgJymGyUm
	WQ6HspF8Qza9x4AM2AiIsRTqEJ6tXldPeJ6yNqhbRJkxD0csbkU/GQMTw1OnqSOyE93Sm7rgzocDv
	zcp90Rn0scSDDPakgC/2s8ajlLAkLepN3zSzZBSEO8Sza43Z5qHdfbCx3CFejF9NlUfQe5b4uE0dH
	DZ4hSpuMlrOH3ZCdocQThrg8yyW5GP9T5tXivpuhSXa53gpPAxFgG2bSud4Ot6/+vg/wumLSlmGOk
	gUfHjsErJyHzU0d8oiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu3K-00000007I8X-3dCz;
	Tue, 24 Nov 2026 17:11:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu0y-00000007GpD-1Ie9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:09:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E6961BF7;
	Tue, 24 Nov 2026 09:09:04 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 844433F763;
	Tue, 24 Nov 2026 09:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540147; bh=WLvfCFlEIWFhaDDkz93d5wP8jzbKH6HmgGTfvFPZwng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWocWBU/5CVzYQ4U2xUIBzR63sfKb1iFzcCTDLtlcM09r8c4gBx3aNNhGMZxkd0Ks
	 ADTvCBgRj21Kz+P+9EEP9ZMyfUedveBYkAjrkwqJk8tPt/d3001VwqaYeBjcFsW+W/
	 62O8DVo6tq/NIA5Aj+97lZ5yazbS1ILiLCxSXbc4=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:49 +0000
Subject: [PATCH 21/24] media: uapi: Add parameter structs to
 mali-c720-config.h
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-21-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=25436;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=LdKlOLTssW6rsw3XGOpSv09idn9yFA5owRXSnZEl0po=;
 b=ewm9wlJKFg97S5peDe3gLEO/93f+UOgYnuD+hcmh1+iGWgv77CbcQxECqRr14HVQIHxIPFcms
 16HFGHIpImABFSBdMbTIPBtQHHA9/Q4ZB5XrbysifBU14z35KqKJBn9
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090909_012281_6891F6CD 
X-CRM114-Status: GOOD (  17.22  )
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

Add structures defining the ISP parameters to mali-c720-config.h.
Additionally add a custom control ID for querying supported parameter
blocks.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 include/uapi/linux/media/arm/mali-c720-config.h | 554 ++++++++++++++++++++++++
 1 file changed, 554 insertions(+)

diff --git a/include/uapi/linux/media/arm/mali-c720-config.h b/include/uapi/linux/media/arm/mali-c720-config.h
index 445cae09a84cce37de9b15e051b93f96b06cbc50..f200380f3c2c8df05fa81d7348300ddad342ca02 100644
--- a/include/uapi/linux/media/arm/mali-c720-config.h
+++ b/include/uapi/linux/media/arm/mali-c720-config.h
@@ -14,6 +14,8 @@
 
 #define MALI_C720_MAX_ZONES 1024
 
+#define MALI_C720_NUM_DECOMPANDER_LUT_ELEMENTS 33
+
 /**
  * struct mali_c720_awb_stats_nodes_used - Color statistics zone dimensions
  * @reserved1: Undefined buffer space
@@ -179,6 +181,558 @@ struct mali_c720_stats_histogram {
 	 sizeof(struct mali_c720_stats_histogram) +		\
 	 sizeof(struct mali_c720_stats_histogram))
 
+/**
+ * enum mali_c720_param_block_type - Mali-C720 parameter block targets
+ *
+ * @MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP: Digital gain for the input pipeline.
+ * @MALI_C720_PARAM_BLOCK_HISTOGRAM_INP: Histogram configuration for the input pipeline.
+ * @MALI_C720_PARAM_BLOCK_AWB_GAINS_HV: Auto-white balance gains for the HV pipeline.
+ * @MALI_C720_PARAM_BLOCK_HISTOGRAM_HV: HV histogram configuration (pre-Iridix).
+ * @MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX: HV histogram configuration (post-Iridix).
+ * @MALI_C720_PARAM_BLOCK_COLOR_STATS_HV: Color stats configuration for the HV pipeline.
+ * @MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV: Black level offsets for the HV pipeline.
+ * @MALI_C720_PARAM_BLOCK_SQRT_INP: Square root configuration for the input pipeline.
+ * @MALI_C720_PARAM_BLOCK_SQUARE_A_HV: Square A configuration for the HV pipeline.
+ * @MALI_C720_PARAM_BLOCK_SQUARE_B_HV: Square B configuration for the HV pipeline.
+ * @MALI_C720_PARAM_BLOCK_SQRT_HV: Square root configuration for the HV pipeline.
+ * @MALI_C720_PARAM_BLOCK_DECOMPANDER_INP: Decompander configuration.
+ *
+ * Each identifier selects one logical module and instance. Applications can
+ * query V4L2_CID_MALI_C720_PARAM_CAPABILITIES for the targets present on the
+ * device. The control returns a read-only U16 array of supported identifiers.
+ */
+enum mali_c720_param_block_type {
+	MALI_C720_PARAM_BLOCK_DIGITAL_GAIN_INP,
+	MALI_C720_PARAM_BLOCK_HISTOGRAM_INP,
+	MALI_C720_PARAM_BLOCK_AWB_GAINS_HV,
+	MALI_C720_PARAM_BLOCK_HISTOGRAM_HV,
+	MALI_C720_PARAM_BLOCK_HISTOGRAM_HV_IRIDIX,
+	MALI_C720_PARAM_BLOCK_COLOR_STATS_HV,
+	MALI_C720_PARAM_BLOCK_BLACK_LEVEL_HV,
+	MALI_C720_PARAM_BLOCK_SQRT_INP,
+	MALI_C720_PARAM_BLOCK_SQUARE_A_HV,
+	MALI_C720_PARAM_BLOCK_SQUARE_B_HV,
+	MALI_C720_PARAM_BLOCK_SQRT_HV,
+	MALI_C720_PARAM_BLOCK_DECOMPANDER_INP,
+	MALI_C720_PARAM_BLOCK_MAX,
+};
+
 #define V4L2_CID_MALI_C720_STATS_CAPABILITIES		(V4L2_CID_USER_MALI_C720_BASE + 0)
+#define V4L2_CID_MALI_C720_PARAM_CAPABILITIES		(V4L2_CID_USER_MALI_C720_BASE + 1)
+
+enum mali_c720_params_digital_gain_mask {
+	MALI_C720_PARAMS_DIGITAL_GAIN_MASK_GAIN,
+	MALI_C720_PARAMS_DIGITAL_GAIN_MASK_OFFSET,
+};
+
+/**
+ * struct mali_c720_params_digital_gain - Digital gain settings
+ *
+ * This struct configures the digital gain and a common black level for all
+ * color channels.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_digital_gain_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @gain: Input digital gain in unsigned Q12.8 format [0..1048575]; 256 = 1x
+ * @offset: Input black level [0..16777215]
+ */
+struct mali_c720_params_digital_gain {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u32 gain;
+	__u32 offset;
+};
+
+enum mali_c720_params_awb_gains_mask {
+	MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN00,
+	MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN01,
+	MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN10,
+	MALI_C720_PARAMS_AWB_GAINS_MASK_GAIN11,
+};
+
+/**
+ * struct mali_c720_params_awb_gains - Gain settings for auto white balance
+ *
+ * There are four gain settings corresponding to the Bayer color channels.
+ * The ISP accounts for the input Bayer order, so the mapping to R, Gr, Gb
+ * and B is independent of that order. A value of 256 represents a 1x gain.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_awb_gains_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @gain00: Multiplier for color channel 00 (R), unsigned Q4.8 [0..4095]
+ * @gain01: Multiplier for color channel 01 (Gr), unsigned Q4.8 [0..4095]
+ * @gain10: Multiplier for color channel 10 (Gb), unsigned Q4.8 [0..4095]
+ * @gain11: Multiplier for color channel 11 (B), unsigned Q4.8 [0..4095]
+ */
+struct mali_c720_params_awb_gains {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u16 gain00;
+	__u16 gain01;
+	__u16 gain10;
+	__u16 gain11;
+};
+
+enum mali_c720_params_black_level_mask {
+	MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN00,
+	MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN01,
+	MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN10,
+	MALI_C720_PARAMS_BLACK_LEVEL_MASK_CHAN11,
+};
+
+/**
+ * struct mali_c720_params_black_level - Black level for each color channel
+ *
+ * This struct configures black level subtraction from each Bayer color channel.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_black_level_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @chan00: Offset from color channel 00 (R); HV range [0..65535]
+ * @chan01: Offset from color channel 01 (Gr); HV range [0..65535]
+ * @chan10: Offset from color channel 10 (Gb); HV range [0..65535]
+ * @chan11: Offset from color channel 11 (B); HV range [0..65535]
+ */
+struct mali_c720_params_black_level {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u32 chan00;
+	__u32 chan01;
+	__u32 chan10;
+	__u32 chan11;
+};
+
+enum mali_c720_params_square_sqrt_mask {
+	MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_IN,
+	MALI_C720_PARAMS_SQUARE_SQRT_MASK_BL_OUT,
+	MALI_C720_PARAMS_SQUARE_SQRT_MASK_NORMALIZATION,
+};
+
+/**
+ * struct mali_c720_params_sqrt - Configuration for the square root module
+ *
+ * The square root module compands linear data into the square root domain,
+ * with black level correction and normalization.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_square_sqrt_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @normalization: Normalization coefficient applied before the square root,
+ *                 in Q1.16 format [0..131071]; 65536 = 1.0
+ * @black_level_linear: Input black level in the linear domain [0..16777215]
+ * @black_level_sqrt: Output black level in the square root domain [0..4095]
+ */
+struct mali_c720_params_sqrt {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u32 normalization;
+	__u32 black_level_linear;
+	__u16 black_level_sqrt;
+};
+
+/**
+ * struct mali_c720_params_square - Configuration for the square module
+ *
+ * The square module converts square root data back into the linear domain,
+ * with black level correction and normalization.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_square_sqrt_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @black_level_linear: Output black level, [0..4095] for Square-A or
+ *                      [0..16777215] for Square-B
+ * @black_level_sqrt: Input black level, [0..16777215] for Square-A or
+ *                    [0..4095] for Square-B
+ * @normalization: Normalization coefficient applied after squaring,
+ *                 in Q1.16 format [0..131071]; 65536 = 1.0
+ */
+struct mali_c720_params_square {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u32 black_level_linear;
+	__u32 black_level_sqrt;
+	__u32 normalization;
+};
+
+enum mali_c720_params_decompander_mask {
+	MALI_C720_PARAMS_DECOMPANDER_MASK_ENABLE,
+	MALI_C720_PARAMS_DECOMPANDER_MASK_LUT_X,
+	MALI_C720_PARAMS_DECOMPANDER_MASK_LUT_Y,
+};
+
+/**
+ * struct mali_c720_params_decompander - Configuration for the decompander
+ *
+ * The input decompander expands compressed sensor data using a piecewise
+ * linear curve defined by 33 points. Each X/Y pair maps an input pixel
+ * intensity to an expanded output intensity, with linear interpolation
+ * between points.
+ *
+ * The X coordinates must be in nondecreasing order and cover the input range.
+ * A nonzero difference between adjacent X coordinates must be at least 8.
+ * Repeated X coordinates must have equal Y coordinates.
+ * Both lut_x and lut_y fields must be provided together, with their respective
+ * updated_mask bits set.
+ *
+ * Y coordinates may exceed the 24-bit output range or be negative.
+ * Interpolation uses these extended values before clamping the final pixel
+ * output to the 24-bit range [0..16777215]. Nonnegative Y coordinates
+ * [0..0x17fffff] are stored directly; encodings [0x1800000..0x1ffffff]
+ * represent negative values, decoded by subtracting 0x2000000.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_decompander_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @enable: Enable decompanding: 0 = bypass, 1 = enabled
+ * @reserved: Reserved; set to zero
+ * @lut_x: 33 input pixel intensities, unsigned 24-bit [0..16777215]
+ * @lut_y: 33 corresponding output pixel intensities, using the encoding above
+ */
+struct mali_c720_params_decompander {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u8 enable;
+	__u8 reserved[3];
+	__u32 lut_x[MALI_C720_NUM_DECOMPANDER_LUT_ELEMENTS];
+	__u32 lut_y[MALI_C720_NUM_DECOMPANDER_LUT_ELEMENTS];
+};
+
+/**
+ * enum mali_c720_awb_stats_mode - Statistics mode for auto white balance
+ * @MALI_C720_AWB_MODE_GRGB: Green/Red and Green/Blue ratios
+ * @MALI_C720_AWB_MODE_RGBG: Red/Green and Blue/Green ratios
+ */
+enum mali_c720_awb_stats_mode {
+	MALI_C720_AWB_MODE_GRGB = 0,
+	MALI_C720_AWB_MODE_RGBG = 1,
+};
+
+enum mali_c720_params_color_stats_mask {
+	MALI_C720_PARAMS_COLOR_STATS_MASK_NODES_USED_HORIZ,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_NODES_USED_VERT,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_AWB_STATS_MODE,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_WHITE_LEVEL_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_BLACK_LEVEL_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_MAX_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_MIN_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_HIGH_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CR_REF_LOW_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_MAX_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_MIN_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_HIGH_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_CB_REF_LOW_AWB,
+	MALI_C720_PARAMS_COLOR_STATS_MASK_WEIGHTS,
+};
+
+/**
+ * struct mali_c720_params_color_stats - Color statistics configuration
+ *
+ * This struct configures the statistics generated for auto white balance.
+ * Pixel intensity limits exclude overly bright or dark pixels from the
+ * statistics. Color ratio minima and maxima bound a region in R/G and B/G
+ * space, while the high and low ratios trim its upper-right and lower-left
+ * corners. Only pixels whose ratios fall inside the region marked "A" are
+ * counted, independently of @awb_stats_mode::
+ *
+ *     B/G
+ *      ^
+ *  max |  +-----------------+  (high, max)
+ *      |  |                  \
+ *  high|  |                   + (max, high)
+ *      |  |         A         |
+ *  low |  +                   |
+ *      |   \                  |
+ *  min |    +-----------------+
+ *      +--------------------------> R/G
+ *         min low          high max
+ *
+ * Setting low to min and high to max selects the full rectangle.
+ *
+ * The product of @nodes_used_horiz and @nodes_used_vert must not exceed
+ * MALI_C720_MAX_ZONES (1024). Exceeding this limit produces invalid statistics
+ * that cannot be parsed reliably.
+ * When updating zone dimensions, both horizontal and vertical directions must
+ * be provided with their respective updated_mask bits set.
+ *
+ * Zone weights control each zone's contribution to the global statistics.
+ * A weight of 0 excludes the zone; values 1..14 represent weights of
+ * 1/16..14/16 and 15 applies the full weight. Per-zone results are not weighted.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_color_stats_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @nodes_used_horiz: Number of horizontal zones [3..32]
+ * @nodes_used_vert: Number of vertical zones [3..255], subject to the total
+ *                   zone limit above
+ * @awb_stats_mode: Ratio mode, see &enum mali_c720_awb_stats_mode
+ * @reserved: Reserved; set to zero
+ * @white_level_awb: Upper pixel intensity limit (exclusive), 14-bit [0..16383]
+ * @black_level_awb: Lower pixel intensity limit (exclusive), 14-bit [0..16383]
+ * @cr_ref_max_awb: Maximum R/G ratio, unsigned Q4.8 [0..4095]
+ * @cr_ref_min_awb: Minimum R/G ratio, unsigned Q4.8 [0..4095]
+ * @cr_ref_high_awb: R/G ratio trim high, unsigned Q4.8 [0..4095]
+ * @cr_ref_low_awb: R/G ratio trim low, unsigned Q4.8 [0..4095]
+ * @cb_ref_max_awb: Maximum B/G ratio, unsigned Q4.8 [0..4095]
+ * @cb_ref_min_awb: Minimum B/G ratio, unsigned Q4.8 [0..4095]
+ * @cb_ref_high_awb: B/G ratio trim high, unsigned Q4.8 [0..4095]
+ * @cb_ref_low_awb: B/G ratio trim low, unsigned Q4.8 [0..4095]
+ * @weights: Zone weights in row-major order from the top left, one byte per
+ *           zone [0..15]. Index is y * nodes_used_horiz + x.
+ */
+struct mali_c720_params_color_stats {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u8 nodes_used_horiz;
+	__u8 nodes_used_vert;
+	__u8 awb_stats_mode;
+	__u8 reserved;
+	__u16 white_level_awb;
+	__u16 black_level_awb;
+	__u16 cr_ref_max_awb;
+	__u16 cr_ref_min_awb;
+	__u16 cr_ref_high_awb;
+	__u16 cr_ref_low_awb;
+	__u16 cb_ref_max_awb;
+	__u16 cb_ref_min_awb;
+	__u16 cb_ref_high_awb;
+	__u16 cb_ref_low_awb;
+	__u8 weights[MALI_C720_MAX_ZONES];
+};
+
+/**
+ * enum mali_c720_histogram_input - Input for pre-Iridix histograms
+ * @MALI_C720_HISTOGRAM_INPUT_RAW: Raw Bayer data
+ * @MALI_C720_HISTOGRAM_INPUT_LUMA: Luminance data
+ */
+enum mali_c720_histogram_input {
+	MALI_C720_HISTOGRAM_INPUT_RAW = 0,
+	MALI_C720_HISTOGRAM_INPUT_LUMA = 1,
+};
+
+/**
+ * enum mali_c720_histogram_skip_x - Horizontal pixel skipping
+ * @MALI_C720_HISTOGRAM_SKIP_X_EVERY_2ND: Collect every 2nd pixel horizontally
+ * @MALI_C720_HISTOGRAM_SKIP_X_EVERY_3RD: Collect every 3rd pixel horizontally
+ * @MALI_C720_HISTOGRAM_SKIP_X_EVERY_4TH: Collect every 4th pixel horizontally
+ * @MALI_C720_HISTOGRAM_SKIP_X_EVERY_5TH: Collect every 5th pixel horizontally
+ * @MALI_C720_HISTOGRAM_SKIP_X_EVERY_8TH: Collect every 8th pixel horizontally
+ * @MALI_C720_HISTOGRAM_SKIP_X_EVERY_9TH: Collect every 9th pixel horizontally
+ */
+enum mali_c720_histogram_skip_x {
+	MALI_C720_HISTOGRAM_SKIP_X_EVERY_2ND = 0,
+	MALI_C720_HISTOGRAM_SKIP_X_EVERY_3RD = 1,
+	MALI_C720_HISTOGRAM_SKIP_X_EVERY_4TH = 2,
+	MALI_C720_HISTOGRAM_SKIP_X_EVERY_5TH = 3,
+	MALI_C720_HISTOGRAM_SKIP_X_EVERY_8TH = 4,
+	MALI_C720_HISTOGRAM_SKIP_X_EVERY_9TH = 5,
+};
+
+/**
+ * enum mali_c720_histogram_skip_y - Vertical pixel skipping
+ * @MALI_C720_HISTOGRAM_SKIP_Y_ALL: Collect every row
+ * @MALI_C720_HISTOGRAM_SKIP_Y_EVERY_2ND: Collect every 2nd row
+ * @MALI_C720_HISTOGRAM_SKIP_Y_EVERY_3RD: Collect every 3rd row
+ * @MALI_C720_HISTOGRAM_SKIP_Y_EVERY_4TH: Collect every 4th row
+ * @MALI_C720_HISTOGRAM_SKIP_Y_EVERY_5TH: Collect every 5th row
+ * @MALI_C720_HISTOGRAM_SKIP_Y_EVERY_8TH: Collect every 8th row
+ * @MALI_C720_HISTOGRAM_SKIP_Y_EVERY_9TH: Collect every 9th row
+ */
+enum mali_c720_histogram_skip_y {
+	MALI_C720_HISTOGRAM_SKIP_Y_ALL = 0,
+	MALI_C720_HISTOGRAM_SKIP_Y_EVERY_2ND = 1,
+	MALI_C720_HISTOGRAM_SKIP_Y_EVERY_3RD = 2,
+	MALI_C720_HISTOGRAM_SKIP_Y_EVERY_4TH = 3,
+	MALI_C720_HISTOGRAM_SKIP_Y_EVERY_5TH = 4,
+	MALI_C720_HISTOGRAM_SKIP_Y_EVERY_8TH = 5,
+	MALI_C720_HISTOGRAM_SKIP_Y_EVERY_9TH = 6,
+};
+
+/**
+ * enum mali_c720_histogram_row_column_offset - Starting row or column
+ * @MALI_C720_HISTOGRAM_FIRST_ROW_OR_COL: Start from the first row or column
+ * @MALI_C720_HISTOGRAM_SECOND_ROW_OR_COL: Start from the second row or column
+ */
+enum mali_c720_histogram_row_column_offset {
+	MALI_C720_HISTOGRAM_FIRST_ROW_OR_COL = 0,
+	MALI_C720_HISTOGRAM_SECOND_ROW_OR_COL = 1,
+};
+
+/**
+ * enum mali_c720_histogram_scale - Intensity range scaling
+ * @MALI_C720_HISTOGRAM_SCALE_1X: No scaling
+ * @MALI_C720_HISTOGRAM_SCALE_2X: Scale by 2
+ * @MALI_C720_HISTOGRAM_SCALE_4X: Scale by 4
+ * @MALI_C720_HISTOGRAM_SCALE_8X: Scale by 8
+ * @MALI_C720_HISTOGRAM_SCALE_16X: Scale by 16
+ */
+enum mali_c720_histogram_scale {
+	MALI_C720_HISTOGRAM_SCALE_1X = 0,
+	MALI_C720_HISTOGRAM_SCALE_2X = 1,
+	MALI_C720_HISTOGRAM_SCALE_4X = 2,
+	MALI_C720_HISTOGRAM_SCALE_8X = 3,
+	MALI_C720_HISTOGRAM_SCALE_16X = 4,
+};
+
+/**
+ * enum mali_c720_histogram_plane_mode - Mode for histogram collection
+ * @MALI_C720_HISTOGRAM_COMBINED: All color planes in one 1024-bin histogram
+ *                              with a bin width of 16384
+ * @MALI_C720_HISTOGRAM_SEPARATE: Each color plane in one 256-bin histogram
+ *                             with a bin width of 65536
+ * @MALI_C720_HISTOGRAM_SEPARATE_ALL: As %MALI_C720_HISTOGRAM_SEPARATE, without
+ *                                 pixel skipping; ignores skip and offset fields
+ * @MALI_C720_HISTOGRAM_FOCUS_00: Top left plane in the first bank, rest in second bank
+ * @MALI_C720_HISTOGRAM_FOCUS_01: Top right plane in the first bank, rest in second bank
+ * @MALI_C720_HISTOGRAM_FOCUS_10: Bottom left plane in the first bank, rest in second bank
+ * @MALI_C720_HISTOGRAM_FOCUS_11: Bottom right plane in the first bank, rest in second bank
+ *
+ * In the "focus" modes statistics are collected into two 512-bin histograms
+ * with a bin width of 32768. One color plane is in the first histogram with
+ * the remainder combined into the second. The four options represent which
+ * of the four positions in a Bayer pattern is the focused plane.
+ *
+ * Bin widths are expressed in 24-bit input levels with intensity scaling set
+ * to %MALI_C720_HISTOGRAM_SCALE_1X. Value 3 is reserved.
+ */
+enum mali_c720_histogram_plane_mode {
+	MALI_C720_HISTOGRAM_COMBINED = 0,
+	MALI_C720_HISTOGRAM_SEPARATE = 1,
+	MALI_C720_HISTOGRAM_SEPARATE_ALL = 2,
+	MALI_C720_HISTOGRAM_FOCUS_00 = 4,
+	MALI_C720_HISTOGRAM_FOCUS_01 = 5,
+	MALI_C720_HISTOGRAM_FOCUS_10 = 6,
+	MALI_C720_HISTOGRAM_FOCUS_11 = 7,
+};
+
+enum mali_c720_params_histogram_mask {
+	MALI_C720_PARAMS_HISTOGRAM_MASK_STREAM_MUX_SEL,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_NODES_USED_HORIZ,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_NODES_USED_VERT,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_SKIP_X,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_SKIP_Y,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_OFFSET_X,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_OFFSET_Y,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_SCALE_BOTTOM,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_SCALE_TOP,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_PLANE_MODE,
+	MALI_C720_PARAMS_HISTOGRAM_MASK_WEIGHTS,
+};
+
+/**
+ * struct mali_c720_params_histogram - Histogram configuration
+ *
+ * This struct configures the 1024-bin histograms. The parameters allow
+ * particular regions of the image to be masked and different kinds of
+ * histogram to be selected.
+ *
+ * The @skip_x, @offset_x, @skip_y and @offset_y fields select pixels by their
+ * position relative to the top left of the image. These fields reduce the
+ * number of pixels counted, but some combinations exclude entire Bayer color
+ * components.
+ *
+ * The zone dimensions define the spatial weighting grid, whose total number
+ * of zones must not exceed MALI_C720_MAX_ZONES (1024). A zero weight
+ * excludes the zone from the histogram.
+ * When updating zone dimensions, both horizontal and vertical directions must
+ * be provided with their respective updated_mask bits set.
+ *
+ * @scale_bottom and @scale_top increase bin resolution at the dark and bright
+ * ends of the input range respectively. Samples outside the selected ranges
+ * do not contribute to the histogram.
+ *
+ * Set header.type to the target from &enum mali_c720_param_block_type.
+ * See &enum mali_c720_params_histogram_mask for the @updated_mask bit positions.
+ * Undefined bits are reserved and must be set to zero.
+ *
+ * @header: The generic V4L2 ISP block header
+ * @updated_mask: Mask of configuration fields to update
+ * @stream_mux_select: Input selection for pre-Iridix histograms. See
+ *                     &enum mali_c720_histogram_input. Ignored for other targets.
+ * @nodes_used_horiz: Number of active zones horizontally [1..255], subject to the total
+ *                    zone limit above
+ * @nodes_used_vert: Number of active zones vertically [1..255], subject to the total
+ *                   zone limit above
+ * @skip_x: Horizontal decimation. See &enum mali_c720_histogram_skip_x
+ * @skip_y: Vertical decimation. See &enum mali_c720_histogram_skip_y
+ * @offset_x: Skip the first column, or not. See &enum mali_c720_histogram_row_column_offset
+ * @offset_y: Skip the first row, or not. See &enum mali_c720_histogram_row_column_offset.
+ *            With @skip_y set to %MALI_C720_HISTOGRAM_SKIP_Y_ALL, this selects
+ *            the starting column on alternate rows instead.
+ * @scale_bottom: Scale pixels in the bottom half of the intensity range.
+ *                See &enum mali_c720_histogram_scale
+ * @scale_top: Scale pixels in the top half of the intensity range.
+ *             See &enum mali_c720_histogram_scale
+ * @plane_mode: Plane separation mode. See &enum mali_c720_histogram_plane_mode
+ * @reserved: Reserved; set to zero
+ * @weights: Zone weighting, one byte per zone, starting at the top left and
+ *           continuing in raster order. Each zone can be weighted in [0..15].
+ *           The grid has @nodes_used_horiz columns and @nodes_used_vert rows.
+ */
+struct mali_c720_params_histogram {
+	struct v4l2_isp_block_header header;
+	__u64 updated_mask;
+	__u8 stream_mux_select;
+	__u8 nodes_used_horiz;
+	__u8 nodes_used_vert;
+	__u8 skip_x;
+	__u8 skip_y;
+	__u8 offset_x;
+	__u8 offset_y;
+	__u8 scale_bottom;
+	__u8 scale_top;
+	__u8 plane_mode;
+	__u8 reserved[2];
+	__u8 weights[MALI_C720_MAX_ZONES];
+};
+
+/**
+ * MALI_C720_PARAMS_MAX_SIZE - Maximum size of all parameters for Mali-C720
+ * in a full hardware configuration.
+ *
+ * Though the parameters for the Mali-C720 are passed as optional blocks, the
+ * driver still needs to know the absolute maximum size so that it can allocate
+ * a buffer sized appropriately to accommodate userspace attempting to set all
+ * possible parameters in a single frame.
+ *
+ * Some structs are in this list multiple times. Where that's the case, it just
+ * reflects the fact that several block identifiers share the same payload
+ * structure.
+ */
+#define MALI_C720_PARAMS_MAX_SIZE				\
+	(sizeof(struct mali_c720_params_digital_gain) +		\
+	 sizeof(struct mali_c720_params_histogram) +		\
+	 sizeof(struct mali_c720_params_awb_gains) +		\
+	 sizeof(struct mali_c720_params_histogram) +		\
+	 sizeof(struct mali_c720_params_histogram) +		\
+	 sizeof(struct mali_c720_params_color_stats) +		\
+	 sizeof(struct mali_c720_params_black_level) +		\
+	 sizeof(struct mali_c720_params_sqrt) +			\
+	 sizeof(struct mali_c720_params_square) +		\
+	 sizeof(struct mali_c720_params_square) +		\
+	 sizeof(struct mali_c720_params_sqrt) +			\
+	 sizeof(struct mali_c720_params_decompander))
 
 #endif

-- 
2.55.0


