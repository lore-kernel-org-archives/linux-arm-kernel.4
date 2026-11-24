Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850BC606A698
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xZr4YDeK;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=SWuzB456
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PLAKBBjfWwaZTSxQGEG3u3gLM52RfLn5YnoJBhqd8CM=; b=xZr4YDeKBgHe0v
	jQ1O36l61FZ+m1y+hfYOPDaNdjiyv168MpWbHgLB612yCdpqGla+gZNqhchdX9JLFZiXD7jUFaBCk
	VMhvA3iui4D+YQepwkWtHYIKykNfIejfaog8tP6+bVYfIGMxtrCZlefTvvMYtuNL4pZn0UuwF5rlN
	8aR9NAjO7jr6AJ314QbEEU/53rmPJTebHyaeCj3jCvLIxvjsQsnH2aEgSbq+nbxyItgguthRCKfAV
	fADYNnF1iC2/SeaiaLzVnZTFdHn1s22SUoCt17Jm/q1/B9sWeBBKosZopEluVOhgfFJnwTtl3e+Tn
	R1CCoUlECsIwM9G2f3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVu0B-00000007GJ7-45oe;
	Tue, 24 Nov 2026 17:08:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtzy-00000007GBH-1buJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:08:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED60339;
	Tue, 24 Nov 2026 09:08:02 -0800 (PST)
Received: from e126453.arm.com (e126453.arm.com [10.33.8.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D43793F763;
	Tue, 24 Nov 2026 09:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795540085; bh=Ee1uoVS+C8ceA693P5UP5IkBsXFB6FbSUzM+Y1SvUg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SWuzB456fR+qplsh3lo8vtTGPCZvp9u96n/f1B4qEmSYCXYgXEtQsHLDcYXbvA/e6
	 ybntTbyZJCCzD5sjf/xhnq0zq7V5B2zS2TxkOKIx2g2WrBJdjcPhYTX2jH79w/IOyP
	 ovKpLwGGo6FEJlS/GGjpQ6wzXqzUlQtyj7CWHdeo=
From: Anthony McGivern <anthony.mcgivern@arm.com>
Date: Tue, 24 Nov 2026 17:07:29 +0000
Subject: [PATCH 01/24] media: uapi: Add 24-bit Bayer media bus formats
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-initial-upstream-candidate-v1-1-0cb9bde1bd30@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795540078; l=14554;
 i=Anthony.McGivern@arm.com; s=20261124; h=from:subject:message-id;
 bh=jW1v1LS7b8VuSi9Ac9uZdb1A5tjhReRMElWF2Idbxps=;
 b=qdr76PomAtxyqkFNIVUVV3J1JBZ09kZtfGVY5UXu/OQelS3MOZFmo1Q2uyO0jWFdSsuxnbgJe
 Fl8FbQKTWuIAHIHq36P54QUXCVoD/PXRS2cDUxVb7C2wEtY5D+vcHgB
X-Developer-Key: i=Anthony.McGivern@arm.com; a=ed25519;
 pk=cvw1HHVRuWpdkn55JpnRyCO2oGBkBWaBXcc2S3CmHTU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_090806_527102_F4F6962A 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

The Mali-C720 ISP processes Bayer data on a 24-bit internal bus. Add
media bus format codes for all four Bayer orders and document their
data layout.

Signed-off-by: Anthony McGivern <Anthony.McGivern@arm.com>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 289 ++++++++++++++++++++-
 include/uapi/linux/media-bus-format.h              |   6 +-
 2 files changed, 291 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c9999b929773b244290b16280b180a9d4f0ff609..6190a1381a4807a7d81d7a9900ea2831606aef30 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2821,11 +2821,11 @@ organization is given as an example for the first pixel only.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-bayer:
 
-.. cssclass: longtable
+.. cssclass:: longtable
 
 .. flat-table:: Bayer Formats
     :header-rows:  2
@@ -2834,10 +2834,14 @@ organization is given as an example for the first pixel only.
     * - Identifier
       - Code
       -
-      - :cspan:`19` Data organization
+      - :cspan:`23` Data organization
     * -
       -
       - Bit
+      - 23
+      - 22
+      - 21
+      - 20
       - 19
       - 18
       - 17
@@ -2875,6 +2879,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2900,6 +2908,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2925,6 +2937,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2950,6 +2966,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -2975,6 +2995,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3000,6 +3024,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3025,6 +3053,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3050,6 +3082,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3075,6 +3111,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3100,6 +3140,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3125,6 +3169,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3150,6 +3198,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3175,6 +3227,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3198,6 +3254,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3223,6 +3283,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3246,6 +3310,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3271,6 +3339,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3294,6 +3366,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3319,6 +3395,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3342,6 +3422,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3365,6 +3449,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3390,6 +3478,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3415,6 +3507,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3440,6 +3536,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`9`
       - r\ :sub:`8`
       - r\ :sub:`7`
@@ -3463,6 +3563,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`11`
       - b\ :sub:`10`
       - b\ :sub:`9`
@@ -3488,6 +3592,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3513,6 +3621,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3538,6 +3650,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`11`
       - r\ :sub:`10`
       - r\ :sub:`9`
@@ -3561,6 +3677,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`13`
       - b\ :sub:`12`
       - b\ :sub:`11`
@@ -3586,6 +3706,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3611,6 +3735,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3636,6 +3764,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`13`
       - r\ :sub:`12`
       - r\ :sub:`11`
@@ -3659,6 +3791,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`15`
       - b\ :sub:`14`
       - b\ :sub:`13`
@@ -3684,6 +3820,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3709,6 +3849,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3734,6 +3878,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`15`
       - r\ :sub:`14`
       - r\ :sub:`13`
@@ -3755,6 +3903,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SBGGR20_1X20
       - 0x3021
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`19`
       - b\ :sub:`18`
       - b\ :sub:`17`
@@ -3780,6 +3932,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGBRG20_1X20
       - 0x3022
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`19`
       - g\ :sub:`18`
       - g\ :sub:`17`
@@ -3805,6 +3961,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGRBG20_1X20
       - 0x3023
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`19`
       - g\ :sub:`18`
       - g\ :sub:`17`
@@ -3830,6 +3990,129 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SRGGB20_1X20
       - 0x3024
       -
+      -
+      -
+      -
+      -
+      - r\ :sub:`19`
+      - r\ :sub:`18`
+      - r\ :sub:`17`
+      - r\ :sub:`16`
+      - r\ :sub:`15`
+      - r\ :sub:`14`
+      - r\ :sub:`13`
+      - r\ :sub:`12`
+      - r\ :sub:`11`
+      - r\ :sub:`10`
+      - r\ :sub:`9`
+      - r\ :sub:`8`
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SBGGR24-1X24:
+
+      - MEDIA_BUS_FMT_SBGGR24_1X24
+      - 0x3025
+      -
+      - b\ :sub:`23`
+      - b\ :sub:`22`
+      - b\ :sub:`21`
+      - b\ :sub:`20`
+      - b\ :sub:`19`
+      - b\ :sub:`18`
+      - b\ :sub:`17`
+      - b\ :sub:`16`
+      - b\ :sub:`15`
+      - b\ :sub:`14`
+      - b\ :sub:`13`
+      - b\ :sub:`12`
+      - b\ :sub:`11`
+      - b\ :sub:`10`
+      - b\ :sub:`9`
+      - b\ :sub:`8`
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+
+    * .. _MEDIA-BUS-FMT-SGBRG24-1X24:
+
+      - MEDIA_BUS_FMT_SGBRG24_1X24
+      - 0x3026
+      -
+      - g\ :sub:`23`
+      - g\ :sub:`22`
+      - g\ :sub:`21`
+      - g\ :sub:`20`
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+
+    * .. _MEDIA-BUS-FMT-SGRBG24-1X24:
+
+      - MEDIA_BUS_FMT_SGRBG24_1X24
+      - 0x3027
+      -
+      - g\ :sub:`23`
+      - g\ :sub:`22`
+      - g\ :sub:`21`
+      - g\ :sub:`20`
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+
+    * .. _MEDIA-BUS-FMT-SRGGB24-1X24:
+
+      - MEDIA_BUS_FMT_SRGGB24_1X24
+      - 0x3028
+      -
+      - r\ :sub:`23`
+      - r\ :sub:`22`
+      - r\ :sub:`21`
+      - r\ :sub:`20`
       - r\ :sub:`19`
       - r\ :sub:`18`
       - r\ :sub:`17`
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 6005f033e62c04bdd3dff7ac905f5b921341cd47..892b8c0a945e416c242d97962b99c5673eaa3a50 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -124,7 +124,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3025 */
+/* Bayer - next is	0x3029 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -161,6 +161,10 @@
 #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
 #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
 #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
+#define MEDIA_BUS_FMT_SBGGR24_1X24		0x3025
+#define MEDIA_BUS_FMT_SGBRG24_1X24		0x3026
+#define MEDIA_BUS_FMT_SGRBG24_1X24		0x3027
+#define MEDIA_BUS_FMT_SRGGB24_1X24		0x3028
 
 /* JPEG compressed formats - next is	0x4002 */
 #define MEDIA_BUS_FMT_JPEG_1X8			0x4001

-- 
2.55.0


