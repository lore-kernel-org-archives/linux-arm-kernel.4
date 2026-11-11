Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD9606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dwe8ZFFC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vx06wP7sOtawrWt780eGmmqhNLqmiCDx1ykk7VKYMck=; b=Dwe8ZFFCO+DlKDdsZEWr67Ma7u
	AvD5bm/dQ/hP5sMsSVGVAMFRAtg4C+/ZHNfxT+udWd/s/nKRIr7g9YbBc0wh9Evc87xcSzixATbrk
	49f6P/YG2iY+2y8WCwIS3xRUyrHbk74ziHNqn0zpTRSjfXsPdXUdmnv7MI9n+ItzQplCnyxnn9OW0
	s97Jmyswi4Z1zs0xdqVNM7UyMHSnd6VuR4aPdIb+xH317oAQMLJL2XorV1+qsLr+f25+u52R+yb2G
	osnM6OB+cpwFlX5K+OIZ4kT0gnkc3plZVMlWAX6+6doad7MtMnnXN+Imt7GdsfQJNtIDUV5o35Sjj
	2b9VBi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR65m-00000006Pt9-1m1l;
	Wed, 11 Nov 2026 11:02:14 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR65j-00000006Pqi-3XAo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:02:13 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso30655945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394929; x=1794999729;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vx06wP7sOtawrWt780eGmmqhNLqmiCDx1ykk7VKYMck=;
        b=vS8UiLFyaDHEDCQcztjy9nDG/KFvfElqWeOMZci8SDxv+L2UD/Pe10oW5x1e5qX3k6
         ESZwVEoir72UGifIuy9g+YKq+3KG/yBtouZNel2EdyVc0a9DDfr8ntA28tdQp2TN1sM6
         CNYFO0dzvKbYDq5YJQPHqhAfRx7gl3PsXjQ+FzkIWqik7gQXmfIfwZRksqy1oBJw/lHD
         hyHddQotL3GUwM2dpQJ5NkZi8D0WAodQkOrKvbARALeA3d5c2RVLqEZkVocIrvOh56r1
         137rwT//ZP68RWk740tquc6hUNHbmWZeaEp7YWQ0C5wh+ItiD/wjLLPNArUu9WmYT2/x
         gMQA==
X-Forwarded-Encrypted: i=1; AL+hErGj4RreA2IdKpi3vH8XhE3HeMg9dJxZmytohyqZ0sTakY5WbeK1jRbZgGqwhzDNoEc62lXqv+nifdWgtBqixUol@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZSQDQ0vTvvxho6WdCXxkqFkP0T8vXGlqeQqphU/emz6nMpEU1
	73sC2VitjFw69EgKeVo7kBojCmsWgtwMwl6beDc/ZmGdX41PtR/+dFBA3gR7NrhSS1Ctcx0uMGg
	=
X-Gm-Gg: AYBFou2AwHFn5nzeAmy1anvEnSl28ekR2oIRt0194+Iq1k51OAP5bjj8T78R1GvrC6w
	f7Y/PVohcxlbylCWVYbMjrVE9PIBi/yyoTNB12Zx+VXWkxPblRbdSwRlmgOi6HLi7zdIMJtGjgA
	fBqNLTawdZyJlPoGPiHEqGMlTsy+v6tNhKJvfsQqa7FSvzK/IAroylbJKY69ihanDEhqfzV3H9/
	KrrUKbwVoiNIu+SVhWtgWo7PXfGKSZM0Ow2lAw/O7sAMxmIyDWp3R0HKUcIcl9eXiyFmaY8ZGBt
	9V90VfjLe1QafzfOBQ9Wqm6dOduOiXuA1iw8jqTnmXQBc8PcYMemsAg4nYqyNb3UuObmng5Iogm
	+an/7L3XRIPLuuTR57+7cIS6JhBNnL9L7U7w4c1E+w9ubj3E1ygrm8rz6bblI71xSpAaH/ZIHW+
	mvSvJy0TYept8vahRy+VwQXnEtn3035pibOLRdb001loxO+84jS/9Cl3ioIZ+KvG1RTQe66R910
	0mb9Ukmyukr7nvUH08QPx4+ZFgu4T5Go7VBrPm0+EKuKfa+l9WxnCRgh3imWgWUGVGG8lT4SANK
	tps+Kn/pAgcrq43X5tl4Wzn3hWJeslzpE74Hz3SZtgdVKVKE78FTEtTpcv/eIKfra9Hsfv3uChm
	/4uhn3FxCtdywy2kAsb0SH/G3OAw21ETtOlPKQkw2VOQCy6WQ9o8bcEYDpT8e9mHJ2VSTmrGHr1
	oIdOiz4WvqQw==
X-Received: by 2002:a05:600c:a00d:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ba093acadfmr38447905e9.34.1794394929145;
        Wed, 11 Nov 2026 03:02:09 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm85849165e9.0.2026.11.11.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:02:08 -0800 (PST)
Date: Wed, 11 Nov 2026 14:02:04 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Christoffer Dall <cdall@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH v2] KVM: arm64: vgic: Don't truncate offsets in
 vgic_find_mmio_region()
Message-ID: <avRLLMOiudnKoSlk@stanley.mountain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030211_896264_2B54192D 
X-CRM114-Status: GOOD (  20.40  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In vgic_its_has_attr_regs() and vgic_its_attr_regs_access() we take a
u64 "offset" from the user and pass it to vgic_find_mmio_region() to
find the correct region.  The problem is that vgic_find_mmio_region()
truncates the "offset" to 32 bits so we might find a region even
though really we shouldn't.

Later the untruncated offset is used to calculate "addr".

	addr = its->vgic_its_base + offset;

For example, an offset of 0x100000084 finds the 64-bit GITS_CBASER
register at 0x80, and the write reaches update_64bit_reg() with an
offset of 4 into the register and a length of 8.  It exhibits as a
UBSAN warning.

[  183.796046] UBSAN: shift-out-of-bounds in arch/arm64/kvm/vgic/vgic-mmio-v3.c:35:10
[  183.796198] shift exponent 18446744073709551584 is too large for 64-bit type 'long long unsigned int'

The GICv5 IRS code has the same problem in vgic_v5_has_attr_regs() and
vgic_v5_irs_attr_regs_access().

Make vgic_find_mmio_region() and match_region() take the offset as a
u64, so an offset of 2^32 or more no longer matches any region.  The
other callers only pass offsets which fit in 32 bits so they are not
affected.

Fortunately the effect of this bug is very minor.  The worst case is that
the VMM accesses an emulated register and sets something nonsensical
and users are already allowed to do that without the bug.

Fixes: 8331c23c28e8 ("KVM: arm64: vgic-its: Implement vgic_its_has_attr_regs and attr_regs_access")
Fixes: 71091136d145 ("KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region")
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
v2: Change vgic_find_mmio_region() to take a u64 instead of rejecting
    large offsets in the ITS callers, as Marc suggested.  This also
    fixes the GICv5 IRS code which my previous patch didn't.  Drop the
    Cc: stable.

 arch/arm64/kvm/vgic/vgic-mmio.c | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index fddb9da0403d..59bdec495cd7 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -820,7 +820,7 @@ void vgic_write_irq_line_level_info(struct kvm_vcpu *vcpu, u32 intid,
 
 static int match_region(const void *key, const void *elt)
 {
-	const unsigned int offset = (unsigned long)key;
+	const u64 offset = (unsigned long)key;
 	const struct vgic_register_region *region = elt;
 
 	if (offset < region->reg_offset)
@@ -834,7 +834,7 @@ static int match_region(const void *key, const void *elt)
 
 const struct vgic_register_region *
 vgic_find_mmio_region(const struct vgic_register_region *regions,
-		      int nr_regions, unsigned int offset)
+		      int nr_regions, u64 offset)
 {
 	return bsearch((void *)(uintptr_t)offset, regions, nr_regions,
 		       sizeof(regions[0]), match_region);
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.h b/arch/arm64/kvm/vgic/vgic-mmio.h
index 38ed730d68ac..6c3c4de6883e 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.h
+++ b/arch/arm64/kvm/vgic/vgic-mmio.h
@@ -228,6 +228,6 @@ u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
 /* Find the proper register handler entry given a certain address offset */
 const struct vgic_register_region *
 vgic_find_mmio_region(const struct vgic_register_region *regions,
-		      int nr_regions, unsigned int offset);
+		      int nr_regions, u64 offset);
 
 #endif
-- 
2.53.0


