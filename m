Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A222606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HozOLL70;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=Gjhl2+1Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1xhgl5syMRg8qmPTHhAybLDTRj/xX0FiPUcwE+TXMJQ=; b=HozOLL702qIJc6fWGarSgPFw7M
	ij9hCFyQ2Ob/R1mMHzk+l3D4J7n0WTHjxnJrMzX5vVNaTaxVtvY11EgIJmYKD5U9tMbXSTnto7Ftr
	uiQgRwjT9yPrXEq+/wl793EIdHfzFWhsrnDykAPC6gNEKbpGrpq3tEx18GVoJb806d2JPU+h57CO9
	mRoXFQN7GCWh9YL9m+3vNN+J0JuFnasC1Xene94EOx5LU03y3mMNWAZOQmCfnFpk+Hpg2nrRGFeyB
	Gq5JRXse172wpP/hnQuzINC2qXDV4HBu3kKHrHfqra6BRaO8X0e/a46Cn4UJ7H/wfciWViZatUvw/
	LNJSBP6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRJu-00000002xRN-1fAd;
	Mon, 23 Nov 2026 10:30:46 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRJm-00000002xOv-1Sgx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:30:44 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so4132539a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 02:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795429836; x=1796034636; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1xhgl5syMRg8qmPTHhAybLDTRj/xX0FiPUcwE+TXMJQ=;
        b=Gjhl2+1ZRlSsFDstwDInoGmGwXgVOOfhORTBiBEOm7qGZMcTR72VtjFkEV++LZZIrq
         2dFmjPhEdNi9fe1P+ho4sswOkIrWuT2Y8MitW7iaywnKFRvzJqE3N3IDN6iB9gU6Yrlh
         QEFSDNmDw1MC+YvjfjuDpBmmo8lZMUEYUHKH29Zm5JNszeAX1+rc1i6AwO9QMf5Z0GEs
         Pua9sVAZOZkASjl+pyu7okueo01RpjRybu3WiTiI+wZlMPt1Q6/94WdJ8Q2Z9ux8YlGp
         Cl94ws75cAq3W/jfEHqKEdGH41EMWEXC+EaxfWwoVZzaFUrauMG3bGAg2PieA0rKuH3j
         j/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429836; x=1796034636;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1xhgl5syMRg8qmPTHhAybLDTRj/xX0FiPUcwE+TXMJQ=;
        b=lwVZ9vqZZcG4Yo1aDw/OMvI6RY5SiYYrXX2iph0pCqiISqQ8WeDMlGZUuE49eNmM+W
         EyZYMtHO9fMkL63V3UPDpafkclmf4kYX0SgttsmS2MZV8Ag8tgDIz6UAEh9HdVvfVxCP
         Nh+PxjgXcPFueGsvhZuzooVcaC/8RboqQtdeL3Ue35Bfuphu+x418Lwp0dQWzPErsgN9
         7Tg8z5l3UKWX4jJ8FUWdfeu8UUyO5RwiKbLZOgD83pY8yDvQsoOh2Py4VN+P3UKmDIl3
         cBn3yTP7vMLExwOMfi4CnWlIlp3lq86s6cQQsJkOatgaWekHZjRq4KMjeV8zj3tPPKxI
         ZnVA==
X-Forwarded-Encrypted: i=1; AL+hErGNWXe5hJFV4WXFjsW5Zm4+W5YFEYbG4QY7br2NK/6aUFD/BQHbVJ6tOt116CiW395bY7httWMh42iy41YeYNFb@lists.infradead.org
X-Gm-Message-State: APuU4Z9j4X8WZNh9dD0NuavvredaXw99dMcmOJbHfs5B/hlqCSaWpAmV
	rSeF5I/U/+/OONMrF7swNeBKrdRwXEYodSXeWGWDC+bo9ZlANTtMm37oDef5Fdw+M2rAl4PCsin
	moKPaW/u+fA==
X-Gm-Gg: AZFdTZcA0W7CVdFwqck5NnYf3ZnGstTl9VEjG7t6YwT4TgsmEdPGQbs7euUi7pHCUF4
	mGqPEvYWFZ6TPUuwftE6Ay/OJEfklk44CictzvzOIWruvBcyvAnotKeRG/7eRSGTWaljbJPcu4b
	NM9zWwR3l5QD5TZ5aLIEq7GQ+N2b5paiuOhpWD87z+cEXX30jBF5pz8sgDLRnnJL6mIFWRJpLgj
	VjdS6lWhFRaY2PU2jue4Eq3ALNhdPYLgXx/pVbRNwzxABMeZXmBBI4pQe2Ig+ByCwHrfarpeQJZ
	DoiDs9ft9rbiIfXCZaETufot574n6UKH78CETBJADkMboY8tFn2xkx79qTHg6ehdwzqbSKZTEbl
	SWJMC68W6JtpU9Ke937RzsiuuUF+EibnZplfGY2Z89kRxsrZIvW7fQGCoENz/hJ4A+GwUU1DZZl
	KBFPTSZLapg5sIhk4aNDEoieTH2sMYPrm3jfMLAo9eIhXSs+0OxO2f5slXEB9oEt3Jt5sxOl7//
	+BNd0wq+K35vCfQo2psHtcMW6IFighWa4z0wdQuKQWIwnyvIe03ZpwNrjABjvXB07n1YMusEC4a
	Anik3ZNVan6EJm1dtlQ=
X-Received: by 2002:a05:6402:28c3:b0:6b3:b10c:40f9 with SMTP id 4fb4d7f45d1cf-6ba37e9532dmr7417775a12.31.1795429835843;
        Mon, 23 Nov 2026 02:30:35 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm2967549a12.30.2026.11.23.02.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:30:35 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Mon, 23 Nov 2026 13:30:16 +0300
Subject: [PATCH] KVM: arm64: nv: Never invalidate less than a page for a
 TTL hint
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-inval_range-v1-1-815e15797089@pereq.eu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02MywqDMBBFf0VmbSAPFOqvFJEkTupISUvGSkH8d
 xPduDz3cTZgTIQMXbVBwpWYPjGDqivwk40vFDRmBi11q5Q2guJq30M6K/loXAhWjgYN5Mc3YaD
 /aXv2F/PPzeiXoigLZxmFy28/leguKxXs+wF3KZ0pkgAAAA==
X-Change-ID: 20261123-inval_range-095bffa0d3e3
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 stable@vger.kernel.org, Dan Carpenter <dan@pereq.eu>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_023043_438525_72883EFB 
X-CRM114-Status: GOOD (  11.68  )
X-Spam-Score: -1.8 (-)
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

The compute_tlb_inval_range() function takes the size of a nested TLB
invalidation from the TTL hint in the TLBI operand.  A guest hypervisor
can give a 4K level-3 hint, which asks for a 4K invalidation.  On a host
with 16K or 64K pages that is less than one page.  s2_mmu_unmap_ipa()
passes the 4K size to kvm_stage2_unmap_range(), which hits
WARN_ON(size & ~PAGE_MASK).

WARNING: arch/arm64/kvm/mmu.c:407 at kvm_stage2_unmap_range+0x38/0x60, CPU#1: ipas2e1_ttl_tes/568
Call trace:
 kvm_stage2_unmap_range (arch/arm64/kvm/mmu.c:410) (P)
 s2_mmu_unmap_ipa (arch/arm64/kvm/sys_regs.c:4246)
 kvm_s2_mmu_iterate_by_vmid (arch/arm64/kvm/nested.c:770)
 handle_ipas2e1is (arch/arm64/kvm/sys_regs.c:4258)
 perform_access (arch/arm64/kvm/sys_regs.c:4917)
 kvm_handle_sys_reg (arch/arm64/kvm/sys_regs.c:5455)
 handle_exit (arch/arm64/kvm/handle_exit.c:466)
 kvm_arch_vcpu_ioctl_run (arch/arm64/kvm/arm.c:1583)
 kvm_vcpu_ioctl (virt/kvm/kvm_main.c:4595)

The shadow stage-2 is built from host pages, so invalidating less than
a page makes no sense.  Return at least PAGE_SIZE.

Fixes: d1de1576dc21 ("KVM: arm64: nv: Handle FEAT_TTL hinted TLB operations")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78d5b18dbd2d..e964b122e9d0 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -735,7 +735,7 @@ unsigned long compute_tlb_inval_range(struct kvm_s2_mmu *mmu, u64 val)
 	}
 
 	WARN_ON(!max_size);
-	return max_size;
+	return max(max_size, PAGE_SIZE);
 }
 
 /*

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261123-inval_range-095bffa0d3e3

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


