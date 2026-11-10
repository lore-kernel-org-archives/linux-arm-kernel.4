Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tQd14Gwt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BC5Q69ueJVBYfSsdQ2qZHA2Rh61G6UD4sUcf6Ljc8BU=; b=tQd14GwtelDPBEh03bDcEGOHoM
	fGfv1G9GbWsnwe9VNs6O+zAorgYP8s0uUQ0V6mQilGv3Q26dwXO8RigK9Hhwk5q5xvSChEgCymWSp
	EjzCl3TV2vicfXlp+DOlmBbdeyofV691bQGOYO3RF1Kn1m1X6Z8vr/fHQ7Uhdn9Tg0q4Cm7WZlaX2
	xS+F7cMroT7JdDUxX6nSN3x8NtSEljRwBq4ZOoe+ckSrhy7i0N0/Dr98KJvgwkO7Ak6srT0glQFkE
	blH8K12S10/tnwWIQWYXW0QsUdlQFx+CUOY6dqTh/pTtYEX4+7MyMSBbldULUe3HhTGUw5wK3iVbO
	XKfQbrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe4x-00000002TsJ-3BZk;
	Tue, 10 Nov 2026 05:07:31 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQe4v-00000002Try-0zB6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:07:30 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so19504035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 21:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287247; x=1794892047;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BC5Q69ueJVBYfSsdQ2qZHA2Rh61G6UD4sUcf6Ljc8BU=;
        b=MvgUm0T1NDHHP73A1qPWl+l9W8Vtl/IMNKRBhb9aHqj14OQJZU9kEvh7cLiaOp1mJc
         /+RFj4jIO6xITiUiYQGvir8foHboWrlCjgCGHm1If8Saq20rs+vaEHKk2qUQVka/D6l9
         Q/kKy0CeztCXuKKFcvQaj2PSUt/4G1sXxXxUjI4UcxrhLQpTbjyis6bBWq/9Tbher2jZ
         q3gv8ictdgdJMpho7TiljkapI7HLh0lEONqCU2vtDv3q+evhRMrEKBhe6HpvoReRfIFl
         BO6hFoVvDjoYc+/0Rr5yfnmY2y+kbWDor8ZO84iClPUXtTyMohvuwiDv0Ygq9iVIiwsl
         I5sQ==
X-Forwarded-Encrypted: i=1; AL+hErHqCtfvQ1seb3J7elE7kecUMEd09gskmeJanERmI0nF8VerkOQD2PRKDb9SQoFE+lxdL/+X6xHWUUi1oNoT7Ct6@lists.infradead.org
X-Gm-Message-State: APuU4Z/dmjmZ8hiacVIVls/e9EoG1yfOwA54kwJp+RmKCT9FUP5ySXSu
	jN7B4pxX/83k6jw1MxhiMCaJ317mvjxH3Ek3IIfuIJoeTVnZl+40o5Zn
X-Gm-Gg: AYBFou3jGzsLt7LmMUBhu3NlUcUUSHsYpQAikMIQaKEaxjhGBC4JKVqVH1Bb3TDLEg9
	a//igm0QrTQ/bsrqkXc6SCIwdoEjWO0FclOkSuzaXNnCHoeMFMsRE/o7sXKzNwiqv+0WjLRdZyq
	KBR3eAJ1A8YbQsQmBj5lOhefhm8+30PuwV0Ip+EFNekb/m5wlS/tIihqw1KU/8bV5Mswaclvf9S
	F1y+W5tREM1PacJaLdf0gmNKUT8GqlejIV0MJTspoeNilY3+4OwO068g8f80QqD3qHeGF3tF1U5
	FnWN/awdnhi6b6EcoKf8ms90TNSzS9QfyupUblcjXhhf25sFj8OMGSwZ7ZOBGelza7tuYmOTNBw
	cdtPSeWUizWswYYyJYq/doAYfxhJad/+hRfpLjKEddeUlsaFGkkLGT/qLBz3YXeMudh5EYGhdcp
	vKUgcffxoXO1W8pC0EmQbepYfkd0o+GefIwS8b++s5PJ1zVqLbl+MeppdR8ew/kAHr5P/yREzGL
	JdT/5e8iQ4dd9Oe0gY91rTGHA1taAiVu1KaOY3p5at+m2fK793+HoSCZYbWrXHNZ7c8jWwC3Adg
	nrPTbixgnZ8un/HtZFTQSiMgHtKNlB4e08s+jWxN6g6kpcD61ZiRiaogUJMYlfmZR5BUto3axrl
	/TGxuKNDwlZPQvEL7EALmvmfup7nk4OaCicpAwwaD5UqzCTaw+6VP5I8qwWUY6PQl
X-Received: by 2002:a05:600c:1914:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ba0233797dmr18691015e9.10.1794287246749;
        Mon, 09 Nov 2026 21:07:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba022fe1absm26105625e9.0.2026.11.09.21.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:07:26 -0800 (PST)
Date: Tue, 10 Nov 2026 08:07:22 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jackie Liu <liuyun01@kylinos.cn>,
	Christoffer Dall <cdall@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH] KVM: arm64: vgic-its: Reject ITS_REGS offsets above U32_MAX
Message-ID: <f4b5c3247f88b9c469758f8e14a386364332f9f4.1794251681.git.dan@cryspen.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_210729_298528_43953308 
X-CRM114-Status: GOOD (  14.44  )
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

The "offset" variable is a u64 that the user controls through the
KVM_SET_DEVICE_ATTR, KVM_GET_DEVICE_ATTR and KVM_HAS_DEVICE_ATTR
ioctls.  The problem is vgic_find_mmio_region() truncates the u64 to a
u32, so it could return a valid region instead of failing.  Then we
use the original incorrect value of "offset" to calculate "addr".

	addr = its->vgic_its_base + offset;

The impact of this bug is relatively minor.  A user in the kvm group
could potentially crash the VMM which they can already do without using
a bug.

Fixes: 8331c23c28e8 ("KVM: arm64: vgic-its: Implement vgic_its_has_attr_regs and attr_regs_access")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 5ce485485a11..532a82bed24c 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -2018,6 +2018,9 @@ static int vgic_its_has_attr_regs(struct kvm_device *dev,
 	gpa_t offset = attr->attr;
 	int align;
 
+	if (offset > U32_MAX)
+		return -ENXIO;
+
 	align = (offset < GITS_TYPER) || (offset >= GITS_PIDR4) ? 0x3 : 0x7;
 
 	if (offset & align)
@@ -2045,6 +2048,9 @@ static int vgic_its_attr_regs_access(struct kvm_device *dev,
 	its = dev->private;
 	offset = attr->attr;
 
+	if (offset > U32_MAX)
+		return -ENXIO;
+
 	/*
 	 * Although the spec supports upper/lower 32-bit accesses to
 	 * 64-bit ITS registers, the userspace ABI requires 64-bit
-- 
2.53.0


