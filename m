Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65855606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Sa5xns0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnrXX/eO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oK1UqNMw8ALfTMiacdC8RCw5rD9bSMFu0hEhUP7jD78=; b=0Sa5xns0vpUxqjLPYFMmMwpuOB
	zWC2LtBdMWRgZv05Ub56ZfHQoGQf+pztWDW74nGqXgBqcwyxV7cDekbkMhiKZ9+K5SEPzXT7txeQx
	L1LEviWG64LAsMqvGgaY3T+LsTi5UTDTLnvdYNXznbrqXukoUVXcTYXwsFLbz8ADNSlx7BJYeINrG
	eJ61iQ84Ryq/MHymAhpNmZFsn/hLTvwPzDsKvCqIbKXCjgatYDi099U2Z1tTPhqIdiZpLckLk1RfK
	OyLnbawQe4phdH9ERqIRESyvMvFG7RlEGXhTNqiWUTZFV2ZDbyGmcIL7VuQOLOEd/4SX6UqpKwX8i
	2JNx/HKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRK-0000000F0SN-0hMT;
	Sat, 07 Nov 2026 16:38:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjRF-0000000F0PJ-3Jcw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 16:38:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so12392465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 08:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794069523; x=1794674323; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oK1UqNMw8ALfTMiacdC8RCw5rD9bSMFu0hEhUP7jD78=;
        b=fnrXX/eOdplUdq9KjyRQ5qUyaNYI1ojSufWykZO+duamebhJ6HYxLtpx+gzBWgjvfG
         vmcvA64W3Ho2MzAQy7faXYob3QMToC8viOaC85TJdY2XvZc+gfrsasdfz4UxXsEryEY8
         cUUhQYYHIIRRdGET5BwtW7uA/FfmsiyxFVDTJGiaYWK2eA6FAqw6Mh+Th6fWOlc5FB9A
         U2Cf4Lx50NH2ANkS2kpe4r3wmdh/7Sy+KAleeWIWKd90aaX0TQfORTkjjj8ec+QH7rgG
         96/07LngWosqMFKAuE0PDkPdsVF87lwfiZ3F11cHTNC2TAtNxSh0VXMDOSxrYoa8AXCb
         EL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069523; x=1794674323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oK1UqNMw8ALfTMiacdC8RCw5rD9bSMFu0hEhUP7jD78=;
        b=zWepFyH8Kmd4VaV3kMYAsCl/EHAfHZtW2L+bDgNzLT39+/kDgDgABZLPSfhDlcMGdr
         2gYW88KTP1to/+40fBDMXgqM30EJocs3yB/QulMyS971PfAPYiYEkA9++4Dxn4bYuydE
         dq6N677gbzzETZ1NZarD2xt7hN2Y4ksUwn4lH0U1Y1KOk7Z9REAExmJ/lM2ctsQu+jhR
         YtB7guiegfZEW60CRJHr6TF3QnHhLyKejqtJ2Cy/0dlu4jsOkKMsDxezZjVaacxW37Vw
         M8aziWLaMXQkBI8e+uJHuj5uhAqzvjYVS9tqqxM8ZgLYB+yKfwGtIH/aKtXe+f1ub8Ik
         Xatw==
X-Forwarded-Encrypted: i=1; AKwUvBzB5cNKdllGXQZH7ti07yGYIARlljNfC+Mni8oAMNFrTkYKdROnAZxfrFAl3MAhLg1hUJWDF+dBrV3zONeZizEx@lists.infradead.org
X-Gm-Message-State: APuU4Z8kum65sl8Krfd1lQDd12sQyJGZvLiAvtffK6RuVVCLKior52B2
	XtfsN3C2lDlNMrmRBYkwZ2IB1W+PatlY0+YQgljloYukMzqpOP7qncgq
X-Gm-Gg: AYBFou041t/Oc2s49KYZ3K7onznaYOOj7jDw4TQm47iZDuL6QL+MiE+iYOTS9x2xBLZ
	7cshDEyf/32RjqTAVJe1p+W/AIKFEhTZYCk1E7in2jPdezrlMTkp7d8es/hGgUryv+J7a/n0mrJ
	QhBY5ZsdSbJWNYa6353m5dc2DPhAWkjqdWOynUhSbougZ0Za7tl5K7L9xlWrKFngHLJ4OFiSlMy
	33nZW3vUni5SC+osXFN8s1tQcDxdquKCSAe/qCovGv9CGu7s2fSy9x72eOFmHG8iIdltENW286+
	AkoqDHPUCvZXW9BW2pQDse6fOtOxHzfqemtoZZHPkgwGJ8ar3ikPGzQBe+xQEG/2QnnINufF0PL
	/I4jwRCMHAh9sG6HRhU28FOy2AJG4REJ20B5myznpA8tAk7afr75n/ujTLKALKVtEV9h9IaBJpd
	j1F8vzAhUQnxyPhf9Xz3bJK9+SxQeEKPTowY5JYovESs6w+rvGq37r/KuOylUYD4U+iK9SH4iTL
	VNo/st3uZr92LW1oEfTrBadO9ZVhiql4a0OHYqTlCSHdFtJY1DtuvpDL+bMBpox0+YxuuaGnAnb
	vo3oQTgMWvj0CFRHOggj8xeZlFKG38PtH6iaTNO1/2GFybFuSD3JpedFcKiXI8iIIQoBoMDCNJ1
	Ou4pUIaY5uiS2rxc=
X-Received: by 2002:a05:600c:8b76:b0:4a0:1efa:c74a with SMTP id 5b1f17b1804b1-4b6df6df28emr105183555e9.20.1794069522860;
        Sat, 07 Nov 2026 08:38:42 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7bb101537sm36117925e9.0.2026.11.07.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:38:42 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH 0/6] firmware: raspberrypi: Style cleanups and registration
 error handling
Date: Sat, 07 Nov 2026 17:38:04 +0100
Message-Id: <20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AEjDSXEVcRJ20s1DDBFqLe
 PdC3wHehSam0pDogslbmx47EvmOsLzy/hTWFYkQXIjeu4GLnmy51VnMvlW5qG2fbMKzPJbowhq
 HvkdHqCZFz389Tvf9AxiWk7NqAAAA
X-Change-ID: 20261107-fix-raspberrypi-firmware-be9c602d6755
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=DQ28gjc1y4PVvUnOLYS9GDNE2byLHmuFa3IBNYA0Ozo=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq71QRw3b/PSC6KrLEuMlv5lgLTraBLSCea0Iod
 +Q5z+ITI7+JAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9UEQAKCRB4zXhFDAXI
 Z/SaD/0cmIY65hp/lDLARQaP/py3EitXBfcrHXgsqO4XPYw5kvSdW0LSo4gIPjsfFgsabkLyA+w
 BgmSx/7rlkii1FmwWqn2kTDk3SRNl7edCGCQJEVQTZee6f+ViTQ9YedwTDA2AIyTx3ssZ5/C0+K
 HpXyyw6+BTDHMhRsoPmrdDLPkJ3eBfO/4zO+NJCDhpFZ20u709Zj582NUypAxBYnZ/owdY5gNvm
 vveypgCSoY89MOBTC/QVzTpu282iySXEag76ddow2PTF1KaGGnV3jfiv8dhvvXL7KBHRprUzWy2
 fAtGcXlGIGiRQeDjZDWRZUeyIHkh42jQ2gElXY8UaYtH2j69X3LIbgN/5flxcK8c5mEHTM4R8Ft
 FWkOmhlWZR3WH+rFQuRH4dvZ+wjP4VoqVdShXwgNrmgXW1OMFnGGZkqknYRSUNXjrrliVScFvWP
 G+hnzBAFIfskMV8m8BfavLhzLcP5haszsXDFj857pgFfCwYlAdgx1FA/ocOMIALDRobY6vtys5W
 8/vWVhCeCBvxjwchFAtEPbkv7+3+/WxEL+Ll2Rs1OjgPBDa4QZ4+sr7NuhVHpzTfXuY7ChUPASF
 TdmVyuSfyMYgvS7qSDdsBI5QuJeGE9ow1/t7XyVp1orIUkPQL0qqY8IQXjhHfHAo2EgSFHp8OJ8
 aMTVIWTkAR77fpA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_083845_839271_B6079681 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series does minor style cleanups in the Raspberry Pi firmware
driver and fixes error handling when registering the hwmon and clock
platform devices.

The first five patches address checkpatch warnings (missing blank lines
after declarations, incorrect indentation, unnecessary braces, and
undocumented memory barriers).

The final patch checks the return value of
platform_device_register_data() so that an error pointer is no longer
stored in the global rpi_hwmon / rpi_clk variables.

---
Sander Speetjens (6):
      firmware: raspberrypi: Add blank line after declaration in response_callback
      firmware: raspberrypi: Fix indentation of return statement
      firmware: raspberrypi: Add blank line after declaration in probe error path
      firmware: raspberrypi: Remove unnecessary braces in transaction helper
      firmware: raspberrypi: Document memory barriers in property list path
      firmware: raspberrypi: Handle device registration errors

 drivers/firmware/raspberrypi.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>


