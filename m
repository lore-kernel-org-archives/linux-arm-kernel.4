Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8796606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T+x6tm6n;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=ji8tEq2k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+Lu9vavZpewMGIe7sT0xaOfi/XcEQNMU46Rb1px6xaQ=; b=T+x6tm6nq6RefhTIPAgDN9aEK7
	rQO9vOXZa5REwob/c7JksCbkRSeGoZaCTpQavQqXOhZanroHXx70Ghj9EdZp3LzLaCyBN98NAXzKL
	mKGmQ99XXIm3VwQRhKiOrEAogxNFWmzMgRAnorucxJhekbMdarqvu0qxor7TTwEWzLQcaaVV1K8ar
	9GkM7CKV8vs6DjSZF6ZhhINqegopAUDLT/qcAkh1gfwtTIzVeSdrz3ukW/qY5yt9AFPMinYkMeo6e
	Z5R+8jIunW5B9NrSgJ75+W8CWAGX2QC78PlmniO74uoac6x5lBgcUWBpjz218ogQ/s/+IBHVbJZkq
	DoUs5/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNQM-00000000VQR-32eo;
	Mon, 09 Nov 2026 11:20:30 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNQJ-00000000VPI-1iTi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:20:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+Lu9vavZpewMGIe7sT0xaOfi/XcEQNMU46Rb1px6xaQ=;
	b=ji8tEq2kl3yMJVCyXuhKV5kQUxqmdEtqB/WIbQEDENZlGB1aLIwIZBLhAPbSEpXEvp1e4QHlJ
	YvvoTfgf8BOy9tyg9DyfdNGYiGTBmljLSMJ9WjKEpdzit6YKOm7Kdn5xDVg6mlKrZjdqrWGOkKQ
	ZiXwFxNoiRHc3vRPapN22mI=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jNS4W0r7wzKm76;
	Mon,  9 Nov 2026 19:20:11 +0800 (CST)
Received: from kwepemk300013.china.huawei.com (unknown [7.202.194.231])
	by mail.maildlp.com (Postfix) with ESMTPS id E49AD4056C;
	Mon,  9 Nov 2026 19:20:19 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk300013.china.huawei.com
 (7.202.194.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 9 Nov
 2026 19:20:19 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
CC: <maz@kernel.org>, <oupton@kernel.org>, <fuad.tabba@linux.dev>,
	<yuzenghui@huawei.com>, <joey.gouly@arm.com>, <seiden@linux.ibm.com>,
	<suzuki.poulose@arm.com>, <yangjinqian1@huawei.com>,
	<liuyonglong@huawei.com>, <wangzhou1@hisilicon.com>,
	<prime.zeng@hisilicon.com>, <tangchengchang@huawei.com>,
	<zhengtian10@huawei.com>, <linuxarm@huawei.com>, <liujian222@huawei.com>
Subject: [PATCH] KVM: arm64: Register irq_bypass consumers only with GICv4
Date: Mon, 9 Nov 2026 19:20:18 +0800
Message-ID: <20261109112018.241298-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk300013.china.huawei.com (7.202.194.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_032027_964986_4C73A76E 
X-CRM114-Status: GOOD (  10.65  )
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

kvm_arch_has_irq_bypass() on arm64 returns true unconditionally, so
every irqfd assignment registers an irq_bypass consumer even when the
hardware cannot perform GICv4 direct MSI forwarding. In that case
kvm_vgic_v4_set_forwarding() bails out at its very first check, since
vgic_supports_direct_msis() is false without has_gicv4, and the
registration becomes pure overhead: every KVM_IRQFD ioctl takes the
global irq_bypass mutex, which becomes a contention point when many
VMs boot concurrently.

Gate the registration on kvm_vgic_global_state.has_gicv4, the way x86
gates on enable_device_posted_irqs. Functionally this is a no-op:
without GICv4 the consumer registration never did anything beyond
acquiring the lock.  On a GICv3-only host booting 100 microVMs
concurrently this cuts the average boot time by ~5 ms, matching the
gain observed with CONFIG_HAVE_KVM_IRQ_BYPASS=n.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb130..785d57388032 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1744,7 +1744,7 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
 
 static inline bool kvm_arch_has_irq_bypass(void)
 {
-	return true;
+	return kvm_vgic_global_state.has_gicv4;
 }
 
 void kvm_idregs_enforce_dependencies(struct kvm *kvm);
-- 
2.33.0


