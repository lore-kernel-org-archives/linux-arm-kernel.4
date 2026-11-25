Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D63606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HjNxz9oi;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=C2FsGqmm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WQnd85yPB60bhdolGWcMJlVAtTrb9nbyVFLWQL59DRE=; b=HjNxz9oiJ6cJPPqYS6EqvS8xKQ
	WOZgXGJZimPRMcXUa9KDSGiViqqZHtAbcm/jcha8Xt+9robrdDjFNiCGfzoIoji6vpJwIGl1pM84y
	apVuQ+oWojxLoCjXjMFAa2OiNBssdOzfzH7iHxLRp/46cihOniQBusDhGo/5eD/1XyN+Y46tOrrU7
	4Vb1Lfko5ogbfr4sz9GIjTPI81w8zHQ0LPTki0pGAiDiZ1HEja/UHROFGFzkfkjaU8DHz0Z0PAm4L
	RkFXf1LNaKomBqvt20inU1svS3Da/apcYAcqsUJdRZHrXNZzKZlhjf/eTZCj4lzagCgSldf/J+HqS
	/gGfECdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vp-00000008lCK-03oJ;
	Wed, 25 Nov 2026 06:56:41 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6vk-00000008lBe-2kPL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:56:38 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so42847875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589794; x=1796194594; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WQnd85yPB60bhdolGWcMJlVAtTrb9nbyVFLWQL59DRE=;
        b=C2FsGqmmBSUgZxk7XQKZG/0T+/l25V1uhAOko/GEdcAD9h6rivh6WeH8j+6fkXZ4dS
         5kqS0DKK9NT/Y8RACejmPfcnVzO/T14mQX5IFf4pf3dkbZKu5q+v8ptnMwpdRUvh8u3e
         PdvGJNnqpWo9KGXiZ0a/uwFQ7Hg1Bt4PQxoHvtnNASS7BpzIJT5GFdmZx2oCI/aCeUqb
         EmyO3FsGH+/YyIqkabOBmDMhboeFcuIZlTZV8chfZcABRRQQrQbgekOd/h4/JqUWNgqc
         fBDiMRWkygAYoCcBiyJ6AaGYfbRGWHxIe95zxTRFICQUkBl+xZE9Xb4dS2mbszgcf4EN
         4zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589794; x=1796194594;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQnd85yPB60bhdolGWcMJlVAtTrb9nbyVFLWQL59DRE=;
        b=VXScYde8WhI5ptWjZqHHiEMZ4igKEtd3eVy8ctv7gs4C+GUsnQ4lIESQ29e/BfBFHP
         0o5D8kjBNJrrFlIv2ZMTcchfUyUf0mM1h5PMB8vTUKTAbOXacvy52TCGkPboofd6IXHV
         eL9UEmSAuNzTxnO030aWGqrPFuJnD/vDv89lEa/iA5Yel7DKRevGVPE8tQ7Db8NfdaU0
         KXOVFlwxdT7pvzUj5E0igOPVM8Sn7cHe1nsZ/oAY6cxPNYgix0Se8Fifi9a5+dUrH9cn
         QL0fj3Xgem5r5WXp4GHOm+bGXMTXXNo1oJUYzPsQh1vZlDRb1VNZMX12UoWwfJ6EQbr1
         z4lQ==
X-Forwarded-Encrypted: i=1; AL+hErEe4/zNtc6P8O08GpvUkV/DbvrcoHkEoRKrKv+77yGfZ4M1qmmecVjNG818YOO//wEvhZ1WSa8jum42HSv2HUWl@lists.infradead.org
X-Gm-Message-State: APuU4Z/oeK5TGcHo7BAHt5pJizPk5n0IDYFflh1Jtkj2Ba5tX7iGcwwm
	oE0PKOSZuzqBa43FMM+zeTieREFV6RrDitqewdiFRz2fHIAb1Rzh4g9TYhP+6yfD6MQ=
X-Gm-Gg: AZFdTZeedyHys6NgJSBY+PujEIDDssubdSAlw/thWMgl19tl58LAkpsw+4vguZahD2B
	q/e++1X8uqlwn8cnXUYyQKTCVsAke4/n+ADeyCAq2X1Ybk80w36yP/FWGthmRfsSpWSKlCXBrUf
	E/5kxkQdqY9IrlTEqW+hjIP17t/GRLuC9dnIrvXHY1xOQnFrcsa6puuQxKoZyq65CKXk7+uz0gs
	BMyEucF6R2KnB8XlqnDy132q/7y6RP3+zjLGWMF6frNhIMWelfWMHj+90lKCDNxhWWHlx5QBEqp
	HZI8NLVbHUwdURBPS+6x4pdhATo9EFuQFz6ojWcmcipIbAfeHJHlv4nokzG4i+ZkwXeJwxomEKD
	9nZ0JPWXv+kibzQm4JoOcoQADJOcRtQVYcyznoF7h3TwiHIBwBeMWhrkTOc9tCIHZM50kDoyy+2
	V0BJEp+//tZshpw2IvH7Yd9Bo9ZA9wzvVSKXRoDxoT+xN7xPGwinoL650TskhkRvPAtehETqci5
	GgwVCOTyhl2IgI3MPXE+TLdT3dhDUe6rsXQKpwETbL76vwEK49/p358fnyCDZ651+F2girBlvsz
	uclAcGycZp8h7XaVb98w
X-Received: by 2002:a05:600c:530e:b0:4ba:eb:eb9b with SMTP id 5b1f17b1804b1-4bb8880aba2mr330852995e9.8.1795589793909;
        Tue, 24 Nov 2026 22:56:33 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm777474785e9.14.2026.11.24.22.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:33 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Subject: [PATCH v2 0/8] KVM: arm64: Fix kvm_reset_vcpu() and SError
 handling for nested virt
Date: Wed, 25 Nov 2026 09:56:15 +0300
Message-Id: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOQQ6CMBBFr0K6toYZxKAr72GIaaej1BiKLRAM4
 e62GFcs/8z7L38Wgb3lIM7ZLDyPNljXxoC7TFCj2gdLa2IWmOMRAHNp3KBffOOJuOsjLFVxMEQ
 lAkAlYq3zfLfTqrzWvxwG/WTqkycRWgWW2quWmnTaGNM/cY0NvfOfddsIyfefUWxnjCBBkqlQl
 yeFBZpLx57fex5EvSzLFySRl6jpAAAA
X-Change-ID: 20261120-double_exception-a34dcc521118
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_225636_775679_E5C35234 
X-CRM114-Status: GOOD (  16.47  )
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

Our formal proof work at Pereq found a way to trigger a WARN() by
injecting two SErrors.  Then Sashiko found several related bugs
and testing uncovered a few more.   The original patch is the same,
it's just that I have added others as well.

I have included a selftest for kvm_reset_vcpu().  I have a selftest
for SError as well but I have a question about that so I'm going to
send it seperately later.

Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
Changes in v2:
- All the patches before [PATCH 7/8] are new to fix other related bugs
- Link to v1: https://patch.msgid.link/20261123-double_exception-v1-1-cd82b59a232d@pereq.eu

To: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Zenghui Yu <yuzenghui@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Christoffer Dall <c.dall@virtualopensystems.com>
To: Rusty Russell <rusty@rustcorp.com.au>
To: Marcelo Tosatti <mtosatti@redhat.com>
To: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
To: James Morse <james.morse@arm.com>
To: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>
Cc: Clément Blaudeau <clement@cryspen.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Dan Carpenter (8):
      KVM: arm64: Drop an incomplete MMIO access when resetting a vcpu
      KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1 when resetting a vcpu
      KVM: arm64: Discard a pending SError when resetting a vcpu
      KVM: arm64: nv: Discard nested SError in kvm_reset_vcpu()
      KVM: arm64: nv: Replace a pending SError when injecting a new one
      KVM: arm64: nv: Don't deliver a pending SError to the wrong guest
      KVM: arm64: nv: Re-inject a stored SError after the exit is handled
      KVM: arm64: selftests: Test that a vcpu reset clears the vcpu's state

 arch/arm64/include/asm/kvm_emulate.h           |   1 +
 arch/arm64/kvm/arm.c                           |   1 +
 arch/arm64/kvm/emulate-nested.c                |  14 ++
 arch/arm64/kvm/inject_fault.c                  |  10 ++
 arch/arm64/kvm/nested.c                        |  16 +-
 arch/arm64/kvm/reset.c                         |   8 +
 tools/testing/selftests/kvm/Makefile.kvm       |   1 +
 tools/testing/selftests/kvm/arm64/vcpu_reset.c | 210 +++++++++++++++++++++++++
 8 files changed, 251 insertions(+), 10 deletions(-)
---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-double_exception-a34dcc521118

Best regards,
--  
Dan Carpenter <dan@pereq.eu>


