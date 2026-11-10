Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB6606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aem2C7Gn;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=gkvOKswQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ld7tlpB+QzKUKDfK4FSxy2dA1rDs18hbb1XMFoIOhuI=; b=aem2C7GnfYG0CujvRZBp/THJ2x
	AWCeZZ7TIX1auZXZi9/h4WC4zRAkD0dBKEcGIi88Cwh28Duw1OINvDByoFh9pEFq1RBtazL82WidZ
	KxyJqfaXN08ezYYX5pkcdhJfFYgPOJMWVX3aq2T1aEZXAHN2CYg5fOzWOwu4wVw5sKoJaM7+xZWxL
	i98tNEuRZX8+7tPDLP2O6gmM1hXAboweWvH0DMEzbqgOgGBeVIGUeVM8u86uueiWhFCqn0Y42hAH1
	ttLZpxbOdr8WzbR5wpyz2wyjffBrEfarq9/dxR0NRDbHmwyk7gSYieTHcrpSbzTWqB5ngozV98O5x
	XqWkzIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlZP-00000003yMy-21LK;
	Tue, 10 Nov 2026 13:07:27 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlZJ-00000003yLy-3zCc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794316042; x=1825852042;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=FZcWkIhdyH5Ehmankjtvhx6cnha9ocIFxpZgxmcPbeA=;
  b=gkvOKswQG2pu7Ug8zWCI1ohCE6n/3HOUDrH5woJpn5Qy6jyADIGKyfK+
   x1ikFB/XBZwA2FTfl7ghC5xHlqCHIXAz5HQR3vkuPEAdZYyoTvV1Okh9i
   2W3kdS2xAxhDr5Nj7c9BflGFmpe1G8bphSZv6w6sxX5rJHOTWbOb2hvvh
   H0e7tuGjZ5Or1wRzTpPlaA1WUnsj7j/sE/9kAi5ywb3yq+IxuKcUc1k+6
   V7YsUmQ74cASOkAwS/aiRQAhB3pzosu8DUe3JeynQQHKtjePj02CdQ1Dv
   zkhWvHd9IG73i6IFmgMU8aNM7Xft98HwvB2UIo2uZOUOBLnUorFJ48Sbw
   A==;
X-CSE-ConnectionGUID: 334fx0ItRxSw82pdD5zSrQ==
X-CSE-MsgGUID: b3euIOAvR1mqeF6AMKIYaA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:07:17 +0200
X-CSE-ConnectionGUID: pPHsg/CST7OIaJsAEVnfQQ==
X-CSE-MsgGUID: wg6sKAfvTLS91yli0OgcOw==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 10 Nov 2026 15:15:11 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Nov 2026 15:07:15 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 10 Nov 2026 15:06:16 +0200
Subject: [PATCH] i2c: nomadik: handle pm_runtime errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-i2c-nomadik-handle-pm_errors-v1-1-ea1ac92af8f4@mobileye.com>
X-B4-Tracking: v=1; b=H4sIAMcW82oC/y2NQQrCMBAAv1L27EISmop+RUTSZKurNqmbVoTSv
 zdqjwPDzAyZhCnDsZpB6M2ZUyygdxX4m4tXQg6FwSjTaK0VsvEYU+8CP7AI4Uk49BcSSZKxPhj
 b2tpZtW+gJAahjj+//On85zy1d/Ljt7kZQq+pfMdNW5YVNuTAA5UAAAA=
X-Change-ID: 20261110-i2c-nomadik-handle-pm_errors-4925b54a5076
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050722_491002_CB816152 
X-CRM114-Status: GOOD (  17.58  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In nmk_i2c_xfer(), pm_runtime_get_sync() is called on start and then
the controller registers are accessed without checking the return value.
If pm_runtime_get_sync() fails, access to the register of the device that
was not correctly powered on may cause a bus fault or other unpredictable
system behavior.

Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() that
always return 0 on success and automatically restores PM usage counter
on failure, and return immediately if it returns any error.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
This is fixed version of patch #6 in a set of fixes in i2c-nomadik
driver:

https://lore.kernel.org/linux-i2c/20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com/

Please replace that patch with this one.

Changes in this version of the patch:

- use pm_runtime_resume_and_get() instead of pm_runtime_get_sync() in
  order to automatically restore the usage counter on failure and always
get 0 on success (pm_runtime_get_sync() may also return 1 if the device
is already active).
- use variable `status` instead of `i` for its return value.
---
 drivers/i2c/busses/i2c-nomadik.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index c3878670da9c..74ecf188c9eb 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -713,12 +713,13 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 		struct i2c_msg msgs[], int num_msgs)
 {
-	int status = 0;
-	int i;
+	int status, i;
 	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
 	int j;
 
-	pm_runtime_get_sync(&priv->adev->dev);
+	status = pm_runtime_resume_and_get(&priv->adev->dev);
+	if (status)
+		return status;
 
 	/* Attempt three times to send the message queue */
 	for (j = 0; j < 3; j++) {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-i2c-nomadik-handle-pm_errors-4925b54a5076

Best regards,
--  
Dmitry Guzman <Dmitry.Guzman@mobileye.com>


