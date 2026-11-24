Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD78606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DFrTPuJk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MfXr9DVs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w+k/XSop6T3iwyoxO1V6neN6LtpJfRFzAgcO+cSEBlI=; b=DFrTPuJk8iCyKMQFbz5jxHqjlx
	369cibmSrHNmjEZoNj3ZylOgUX2K2Hgtriyx1OoC9T20DrC63DRQ5YTNPGgP5uAKQxOz/zirt9grs
	wT1qCMGqytwJ7/xc2m97ureU9RMmXYj9OPr0Te2/0Ox6ydjTGZ0ZDlVYVIRQgws9RtKKuX2ajXVJa
	JqqBNUA1YvZzyKPVpMxQZtSHNyNU6tNXdKufN1vbQ4NGekTptAgqRHLl1CIA9IdmyzMMGfSYUi+El
	LJELaxIJceHS5JMjsQ6d1/YONT8PImxN9fwf7UnnfXLvcd4lCGji3L6mCgzo7sEZHFTI3kO8xCSjV
	k8Ro2+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xViLs-00000005YoC-48od;
	Tue, 24 Nov 2026 04:41:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xViLr-00000005Yni-3Rvq;
	Tue, 24 Nov 2026 04:41:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 423D143656;
	Tue, 24 Nov 2026 04:41:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795495315;
	b=Ujt+ZafxNkdPO8AYE0YAWnp3gePWbGu6E2AFBvUfrpM171Lr7urm4yg1EMgnPVrmorp0
	 0Uaz1JkJntHnHG7TudfRFpKaziLaAPZkZMQvge6EdkIU35BsHMxYsGe0K73Y+Xf/UZpb6
	 TGHvaVOdcASo0t02xAgCICTXSv9brE/mgk6in239nxS9y7srETFvQlfJOCpfuPMSbvwpU
	 cOJ5M7Qo/VAEJfvEZS1dfR6jZY+DngIrTYog3/mQbHAZaE+PVipZQNvh7vq0wqDbJtty1
	 s71lUJRcsUtComDrQvsxuWy6mPsOPjVYxiljQToa+msh3aUCMaoEfmq9AQpieL9ywqw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795495315;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=w+k/XSop6T3iwyoxO1V6neN6LtpJfRFzAgcO+cSEBlI=;
	b=V9WuGdQuJgwltM2ke7I/sfAwvN2MdAzOzxvL0JwoZA/UaVkLEhMUIMQTle2Eqz42fqK8
	 I9K9DIg0XjRd0OcemAI3ReJGauOXzfrbHgEM1+QDWoqoAZ54SQFA7TD8LVfPAhGK/vvY6
	 XxeLLYhi7z49zShO0iEylnY9xiBX4O2Mr0M6vjbWrXV6hF4bG9viCvKF3g1gb8wA7wbFu
	 1SLEqK10EeBSL78DkI4dNf6Fw4ecCa7kh8wybrsvZ4anLa8NrRvYfKDY0G7gFh8VoSizh
	 VPJYdZZNhdK6TR3SlGsA/RZvTcPVBBtxopdektq9azhFhikUrYldtBFsRna3xJSUXiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52F161F000CA;
	Tue, 24 Nov 2026 04:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495315;
	bh=w+k/XSop6T3iwyoxO1V6neN6LtpJfRFzAgcO+cSEBlI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=MfXr9DVs1vBllVYorIBfgTy0hYCHe60ZAZTyNf3hPWl1JQGAG1lFTPj9izFz065uw
	 3WVuYeTCk1oD9L+wS4oSGR8txMyA/pN9X+D0zVUZhqBKw3siyMcMWeLhZ2aAR0Ks//
	 nXMSF3bbnadujDo86yk+F//yKlh+q0uVKApYMwB0a5loJX2xDsPrLMVS9wkrmZ0oTj
	 NBYl1tGIAvSqllzcLuWozyKqsMBmruyAoOLIcXmIuLdjr+OhmZ3fHEKeLajmdBdI0+
	 Y57vovqL2IuArbYtDhfseX2k0z4kCEuVQg9QTcEfuC4leTF+lkBpp+nb3NjZk/tIa6
	 LbXcVW5hH5/dw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD54D4C899;
	Tue, 24 Nov 2026 04:41:48 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 04:41:48 +0000
Subject: [PATCH] crypto: rockchip - Drop the runtime PM reference on DMA
 mapping errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rk-crypto-v1-1-8fb89152fac0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIsVBWsC/yXM0QpAMBSA4VfRubayMcqryMVsB4dCZ4jk3Q2XX
 /39F3hkQg9ldAHjTp7mKUDGEdjeTB0KcsGgEpVLqTLBo7B8Luss0sLlThstU51A6BfGlo7vVdW
 //dYMaNd3APf9APANq8JtAAAA
X-Change-ID: 20261124-rk-crypto-37d6d5a51350
To: clabbe@baylibre.com, heiko@sntech.de, herbert@gondor.apana.org.au, 
 davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-crypto@vger.kernel.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795495308; l=1418;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=AgEW09Ja4be96HPfEZUyJHdtDhjRWUkcTv5e5vEm5VU=;
 b=z5SJG0ZYe/0QvbJ44vYq6t5KtYtYvnZ9FR9nBfe/4VDMot38yUW1Cah2mRq2R8ewl7/tCBvxf
 cFFlOCDNGk/CYbT9LKvmoQdE78WSY+9SQ7MYp4Mj+tExK4ZTiGIahjC
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

rk_cipher_run() takes a runtime PM reference with
pm_runtime_resume_and_get() at the start of every request. The normal
exit path drops it again at the theend label.

If dma_map_sg() fails, the function jumps to theend_sgs or theend_iv
and returns the error without calling pm_runtime_put_autosuspend().
Each such request leaves one usage count behind, so the device can no
longer runtime suspend.

Drop the reference on this error path too.

Found with a static analysis tool and checked by hand.

Fixes: 9dcd71c863a6 ("crypto: rockchip - Add support for RK3399")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Compile tested on arm64 (W=1). I don't have the hardware.
---
 drivers/crypto/rockchip/rk3288_crypto_skcipher.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_skcipher.c b/drivers/crypto/rockchip/rk3288_crypto_skcipher.c
index e80f9148c012..3f285175a194 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_skcipher.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_skcipher.c
@@ -427,6 +427,7 @@ static int rk_cipher_run(struct crypto_engine *engine, void *async_req)
 		dma_unmap_sg(rkc->dev, sgd, 1, DMA_FROM_DEVICE);
 	}
 theend_iv:
+	pm_runtime_put_autosuspend(rkc->dev);
 	return err;
 }
 





