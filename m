Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC124606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=chs7eRmU;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g46Ipwb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nb8/3651PQi+wnO5xWDWcO+y3y5ytYQlH20uezfH+ZU=; b=chs7eRmUQogu6mcNBTdDP22MFD
	rUl65irx/NUYSq8KMl4XmKdJr5NwKfdxd2Dh7cQ9PWfXFKlw6aVIHn9r6xKWbKjiMa2EdnyG+fbXY
	r1rgqk0rYWROGLKSS9qDmy+9OhPdfT18iewyrYwGVCnO/QXduykNDNUEPInz5hJWRrigMrlWrkspE
	1x/Evczvz9tApOAagRIXEnn0cNyutTPo05I5Hen9zws/AWCPpf9sbU15QNgrexotoMxz8cwH2chSk
	yfZlFApo9sxuFAVELDOMRg5g+BWtlCyLXZHLq6sQYa2Yv6+2HurH/qJk+HJHRrXrGW5ImzJAS+jcG
	Oy1niFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZwQ-000000022Ts-2vH1;
	Tue, 10 Nov 2026 00:42:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZwN-000000022TT-26fp;
	Tue, 10 Nov 2026 00:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794271341;
	bh=jelWMB/DBj38lxtsoeFn4zfXVqb37rYafHvCTADg8do=;
	h=From:Date:Subject:To:Cc:From;
	b=g46Ipwb0jR4wdsoxeI1/IuKY3ruRNQ6s2IslOn/OrWU8KUUBc9z3xcC/umjL4slnX
	 nbh4NDNiOTFTpcSVeChDAzlqmXMKyRaVyUyv05jhhjkACerJ9mr5GFv+agnob7n1WZ
	 uvIrb2oXUNtIe8odRRyap1Mdb9lQFd5HhhasoDv/CkbWubfYko5BxIr7H4WBh9Nq0T
	 WGhWaAX9dPWlKqEK0LZdEzDIcbhLkDW6uJvNwjl3S+ss2FHwcfvZx5zGF6dC1FGe12
	 d/iX24t3xZSaLA1gHv0zWYQa+heMuwOctMGJ1m9Cb3MElupRd7dF/gON9gIYSUwJNj
	 r3tp3BYq3Pq0A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F01B117E04E5;
	Tue, 10 Nov 2026 01:42:20 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B1B6148002C; Tue, 10 Nov 2026 01:42:20 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:41:58 +0100
Subject: [PATCH] spi: Fix runtime PM imbalance on pump transfer message
 error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-spi-runtime-pm-fix-v1-1-8601ebb2f6a8@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDtgRlLUq4iLGqc6gjFkYimId
 ze2y+/B+w9QjsIKbXFA5I+obD7DPApw88tPjDJmA5X0NMaUqEEw7j7JyhhWfMsXLTUVWUfW1gT
 5GCLn+Rft+r91HxZ26S7BeV7IM5zedgAAAA==
X-Change-ID: 20261110-spi-runtime-pm-fix-529325c25582
To: Mark Brown <broonie@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Mark Hasemeyer <markhas@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Alexander Shiyan <eagle.alexander923@gmail.com>, 
 stable@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=jelWMB/DBj38lxtsoeFn4zfXVqb37rYafHvCTADg8do=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryaGhpQIC8Xs2xQCf2WNxWILLEANG2wd/+H
 r6D1fb9Mj2nmokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8mhoAAoJENju1/PI
 O/qaX14P/3c6UYpoe1cZY32PTKyEzxN4atoVcyQYaq99xgbTUKYYpP6JTNLg54d4ld2haBuxRfj
 o+qDsMYJ4gUWyQ4V2H0pIFq0GX3TEjZS+VRKGSJUGbwoazuuBJylvkTVmTlo3wH1zO7hdBaNF3A
 yW6lHSpKLN9YXXSwao9+pPoy3DjScR7AwviIdzeuv6If/Bts61DbiRe3/YiMgoGvsacqpcWzSKg
 bfhjyaTG7+k722HYMemRegBTfEGK6oWuh+zuG5T2/fkjle51SkVrtuNh2LNWPe/QUwSCOYYQ+IS
 ui05x0irNBtOKAeQ/UD2UWooaaRGGK3PHx5xATJLJkziEerOUk+FUfkcl3F7tKgdvfP2bFOmK5Q
 fY91hRBL+Fb0LGTPl0an8D6UZdUoXoPQk2Gi9Rl3AqoFWo3bLn6xipYTxcD9JlE0lGLcJ+Ugzoi
 2mPEONJaj0pj7hYabsTHnSmkpx0jatPj5xeucNaz0XTHwAwyP8+6ksNQLGzA8YviYa3YmZ6l3i5
 cwRuPvsOSng6VlFwIz1qvuzzYoJa5n9NTiwHkbeXPXCGV5byHZ4h87IB50VwFvYRFhZP7TzBAZ6
 KHauBdXSwOLBV6AhY/0uruImRt59Wt5nPvD34CnH+w/Y6314OpxcCu+iIRyCdYXdI0LVO3saqXc
 28Lkv86asTjXrLg60mQguCA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_164223_769597_A4B063EC 
X-CRM114-Status: GOOD (  15.14  )
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

The current SPI message pumping code may drop the runtime PM twice when
an SPI message cannot be sent:

spi_master spi2: noqueue transfer failed
rockchip-spi feb20000.spi: Runtime PM usage count underflow!

Fix the problem by always keeping the runtime PM count increased when
exiting __spi_pump_transfer_message(), as the caller handles decreasing
it.

Note, that the function already keeps the RPM usage counter increased
for the error paths following after the prepare_transfer_hardware step.

Cc: stable@vger.kernel.org
Fixes: bef4a48f4ef7 ("spi: Fix null dereference on suspend")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
I noticed this with RK3588 system suspend/resume, which uses SPI based
PMIC and runs into SPI transmission problems when the PM domain driver
tries to disable regulators required by e.g. NPU or GPU domain. I've not
yet checked too closely, but suspect Heiko's atomic SPI transmission
support series might also help with fixing the actual failure.

My patch is not really a v2, but Alexander Shiyan probably ran into the
same issue before and came up with a way different patch and rationale:

https://lore.kernel.org/linux-rockchip/20260806191854.922530-1-eagle.alexander923@gmail.com/
---
 drivers/spi/spi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index ce257b3ec530..4d9c5d026ff6 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1967,7 +1967,6 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
 	if (!was_busy && ctlr->auto_runtime_pm) {
 		ret = pm_runtime_get_sync(ctlr->dev.parent);
 		if (ret < 0) {
-			pm_runtime_put_noidle(ctlr->dev.parent);
 			dev_err(&ctlr->dev, "Failed to power device: %d\n",
 				ret);
 
@@ -1988,9 +1987,6 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
 				"failed to prepare transfer hardware: %d\n",
 				ret);
 
-			if (ctlr->auto_runtime_pm)
-				pm_runtime_put(ctlr->dev.parent);
-
 			msg->status = ret;
 			spi_finalize_current_message(ctlr);
 

---
base-commit: 059518f775baecc9803fc97787bd0b17558f8047
change-id: 20261110-spi-runtime-pm-fix-529325c25582

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


