Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625A9606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DXMsumB6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DBKLzie6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kwqoALvAUHoiWUrDjdoaNf7rx6mzBmQ4g0NH3zyQSKw=; b=DXMsumB6W7PZ7NMWDKgbZGgje6
	MWumrGypuqiR+vtWO+k5BfwH9CCdLecb5DJp+eECz/XF/CtXoYTcvvkohGF7rIyMiroXVPEr20R5V
	qjJEX0x1Llw1G7YqyiqdpvZzXdqETFs6jhqZ5qbECku/2F2iOblTfoD+P396tMHbxIofnLoGFXiA0
	lzO4Up9AzOjcJATaInJgZYQxc/iG1t1B57pV10ZQXsZu/dIwKH0VjRty23yHU70gpBDh4c1jrTi7m
	mO01jN2qnK0RdGhiio8atx1vJVT/k3mA34tjlqCLuRy4zZQrxYnOjF//WfycnlfYZUb9cMS+54m/x
	NZpa/7/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIDS-0000000219R-0v73;
	Mon, 23 Nov 2026 00:47:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVICe-000000020X0-2ZBS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 00:46:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F72B44879;
	Mon, 23 Nov 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795394800;
	b=OsnaK4TX6BjOqeezB0Y8k1vyf/xunFbBdhLF91pkk1O7e5BjMQ6OrkSqj4sYpA2HJ7Nh
	 g/jfRCq13cL5tEoQ5GCFuIzAg+nFUuYaKq4h9B7n+J4x7UOKzuRBbZT+hqfWm043pHe1M
	 sho9RiJv893oOpcpdm0AKjPcDBoIMj1iZOCfaBKWHmfB69TbVAWWaHxNOYRu/KKvsqalO
	 MENM9Sr7otpBPF86/QUKVj0clk4M0xGRt+p1yhk86bL8r4kdh/KJKk8uv3TqTDL/E3SOJ
	 re2TRDkkZMTljGMXTdDCNx9D1CBxW4pGpj/5kHvq9biu0xIqU9pnDxj/WGW7URw7FYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795394800;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kwqoALvAUHoiWUrDjdoaNf7rx6mzBmQ4g0NH3zyQSKw=;
	b=HDcstHDGT844DaQxYI/4MId64UlVzxLkmbfvf/QjyHVdbJv5yCOwjNymQxlUskIJvtly
	 bFfA5ROVYyppWM9xeuMATC3hw0KIzbLOm3M56QL0OYjoCc3BxfBjx9W5oHWLGJJpGM1Ve
	 +9MnK0J5zfJkz5oWkHsEJL+5FBUw9gw5mzqyYFa6ZTrK4fyNU/eLYj/sUDMnzTp2/YC32
	 p5gAavKN4pQRr/1nK4sbTiumAi4DghvoPPSM8preSkFhdscAjvomvlIgSP8L+vitlNNea
	 /enE8Fp+VZ4F2z+aZvtWkTbsyQr5Tl9Te+U4eVCaYpfRVNd+ikqZ86Rof0VVy/cAqYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3E931F000F4;
	Mon, 23 Nov 2026 00:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795394799;
	bh=kwqoALvAUHoiWUrDjdoaNf7rx6mzBmQ4g0NH3zyQSKw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DBKLzie6lUVo4IWXAOW+p21Ja2vrYE8AHnozXy/EAscxpjINHyKtOw/cb2iZCCrHr
	 FgIqyNDxM39ZtSVBLdiPRZutt4zWhhWy8zUQufynXKibXQg90wk+jGHocDoCHdv9kf
	 iR9xBVrVVZ5vxD3GME3VDCfmd0BJu79z5hQAaHDmC4T2UFFbYKdiSJRiqTjL0GbKIa
	 eJQPVmd3Wy9gNEvRCljlscUYj3dyWEGiX0H5fFY6eRcunguI0oMHgr34kNTBTBjonU
	 Rd8i9o5E4016kWju3EHCIhiYcbzPImcux5sPn3Isi/coq9eSlIDgri33zdeQE+Q8YS
	 DJ2hiTT2NuHBg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4EE2A4C276;
	Mon, 23 Nov 2026 00:46:28 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 00:46:28 +0000
Subject: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOOMA2sC/yXMQQ6CMBBA0auQWTsJUwyIVzEs2jrKmFCaDhAI4
 e5UXb7F/zsoJ2GFe7FD4kVUxpBBlwJ8b8ObUZ7ZYEpTE5kKed3CqGh9HDDOE7obuZaa6mqphlz
 FxC9Zf8dH97fO7sN++m7gOE6xNCuvcwAAAA==
X-Change-ID: 20261123-exynos-acpm-put-b81b91734a16
To: tudor.ambarus@linaro.org, krzk@kernel.org, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795394787; l=1475;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=bChsoGwuOPp0ZcQo4sMwjJk0mSKlHPd8ZsaLm0M8RC4=;
 b=dlh7WxPdsQpKUOCbkeS09eaORPYYJsWQ32yurBgjgsxUeyfMzWXuLHNHLFAClztR21aOZnvPM
 egBpPS8BVPoCjv0hliZYoEw/AwDhzC89wp3oPh2bTv7J+55+XXipdwu
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suyuan Wang <stevewong@hust.edu.cn>

When device_link_add() fails, acpm_get_by_node() drops the reference to
the ACPM platform device and only then reads its driver to drop the
module reference:

	platform_device_put(pdev);
	module_put(pdev->dev.driver->owner);

The reference from of_find_device_by_node() is what keeps pdev around
here, so pdev must not be used after the put.

Drop the module reference before the device reference, as
acpm_handle_put() already does.

Found with a static analysis tool and checked by hand.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 (W=1). I don't have the hardware.
---
 drivers/firmware/samsung/exynos-acpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a575caf871b9..15d2f708b0c7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -816,8 +816,8 @@ static struct acpm_handle *acpm_get_by_node(struct device *dev,
 		dev_err(&pdev->dev,
 			"Failed to create device link to consumer %s.\n",
 			dev_name(dev));
-		platform_device_put(pdev);
 		module_put(pdev->dev.driver->owner);
+		platform_device_put(pdev);
 		return ERR_PTR(-EINVAL);
 	}
 





