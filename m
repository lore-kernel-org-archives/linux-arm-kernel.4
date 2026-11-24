Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38197606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tmLApZ04;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nO9xQRq5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mE17vVmVQNaiRNnZ3sKJgOG4MUZ2qjN2wuquPCU/b58=; b=tmLApZ04IZCAWC
	FSW9wybF6VRxANi6rxPD0A5IvYKI698/ID71qEwAIknAIGcWfNTN2JuDDH9kNuwfBYWWGTP7lV/gM
	CzGM/tegzHniT3zbYKDoVoOgHUZhAo1/HriXtJyre9ZstrJeh93mNbNu1LlNJ0OaJRtQzAMSdadVd
	XfodLIpXBM0cWBO9aCwQIyOnGxBv4juup8wlLXalOqdx4GbXHJ1nRqZHVOIJcdCHz9bKlfmqQ7bgC
	/tcv2E7CrvYzhc35ZQF5g4VsjgMHhdLdc1YYRxQ61Kfl7Zbh1fOw/EvLCBAF3BRY/byRImVtz3KP1
	kxa98ygtxKemOuwIA5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu3K-00000007I7s-2fGp;
	Tue, 24 Nov 2026 17:11:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu0v-00000007GoJ-0niC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:09:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 532A71BF3;
	Tue, 24 Nov 2026 09:09:01 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7851D3F763;
	Tue, 24 Nov 2026 09:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540144; bh=Ce+85ggRAd1UhJ8zTp85aEB+VF2sCwEd4DzNDrgIvi0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nO9xQRq5p7PCtn4CJrCINvsKQKscUhNZOe3Nsi5edlT53zozDrSMFbs2zgZUAa3kA
	 MvqjSpN5Hqeb53t/LQpkMzR7eEjymZs8+FUimuDn6AFUM8oT7A1kTX577JpeIg8SG/
	 x/PYxiQ/PgcP0sWXXJnHWMQ9wO7Q9beDYuA8GoGs=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:48 +0000
Subject: [PATCH 20/24] media: uapi: Add Mali-C720 parameters meta format
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-20-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540079; l=1950;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=rql1C8/eZd0TrUw8XoHMFAMSAaQz8Qm4oVzl0nn4Ke0=;
 b=pFGgJ5PNf550bRvbhWuU931KO6YaHXgQbKVLZ9Ufa2Ys1PpQ5zAWQWNwqKV2AM82FRNeBtZbY
 uYnAW+OVsU5CYhVtdQHOoDv1DMC/Zi9LCRMz27aXfOVFJ9ioeMmmkv8
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090905_364287_E2D579BD 
X-CRM114-Status: GOOD (  10.53  )
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
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Anthony McGivern <Anthony.McGivern@arm.com>

Add a new V4L2 meta format code for Mali-C720 ISP parameters.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
 include/uapi/linux/videodev2.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 657adc0f4550e50aafc8855de524eb2e7c6297cb..60b77b18dcc402dd6f0efae8b216bf8fa8b8e6c9 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
+	case V4L2_META_FMT_MALI_C720_PARAMS:	descr = "ARM Mali-C720 ISP Parameters"; break;
 	case V4L2_META_FMT_MALI_C720_STATS:	descr = "ARM Mali-C720 ISP 3A Statistics"; break;
 	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
 	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a59f6642ce3d120c28f395f72653137831ef09b6..b8d06bac29e4bd550b332d57448cce86540e0f87 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -890,6 +890,7 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
 
 /* Vendor specific - used for Arm Mali-C720 ISP */
+#define V4L2_META_FMT_MALI_C720_PARAMS	v4l2_fourcc('C', '7', '2', 'P') /* ARM Mali-C720 Parameters */
 #define V4L2_META_FMT_MALI_C720_STATS	v4l2_fourcc('C', '7', '2', 'S') /* ARM Mali-C720 3A Statistics */
 
 /* Vendor specific - used for Dreamchip RPP-X1 ISP */

-- 
2.55.0


