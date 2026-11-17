Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE51A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GQng1mc2;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rqw4fFDc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uKJuLqQr75Y+bo8J7GoFF1WkhE7oAHbeqLhg/Qlni5U=; b=GQng1mc2X8FUd7GU5lbH1Tu4Tf
	UZ+0cK1TvPiaDX3tp9wUI0od5z622Nr3zXBq5AauS05ISW2EAQg1zqGivRq0LL7PY50QHjhu2c3K7
	M0zAUzW6muvp3+1AN0Cr3/SB1dmyj73hBS/a7pQN9jotgW82zqdYlVzDXjx++pUkbBGC/ISq6R1Le
	XgPp9tkFfGmyTalQdS2hlkvMvKNlD827a+cc6PDWeaKH9VgMDkA4dkQwKD3eTCNGSmTH8kPamWtHF
	9e7hn/u7DjHa0Ne4ZERNI5NVKB3idLYRuO+qHwZ9GRb0TSDQkrayjokKAkVCdb3bdOdaLbMcMy58b
	UmL97KSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPAD-00000006xFM-2JWI;
	Tue, 17 Nov 2026 19:48:21 +0000
Received: from out-97.mta1.migadu.com ([95.215.58.97] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPA9-00000006xF1-3uQY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:48:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uKJuLqQr75Y+bo8J7GoFF1WkhE7oAHbeqLhg/Qlni5U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794944895; v=1; x=1795549695;
 b=rqw4fFDcMRAqhAuvdwRL8hNlOoenIIO7K/12aLpx7A9cgGVc3YWlB9ZmZceoSoSM+DhnuEG4
 SgtimKp2f1bmwBL4YrxaNMYujgzU2DzYWQc50zokR1iu1k1zpbxF+zEsmqI8hRi9oPV02sngOlR
 9TOrnrGM8vZj/DpmlhMtpCDo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3f53a71603751578;
	Tue, 17 Nov 2026 19:48:14 +0000
X-Mizu-Trace-ID: 3f53a71603751578
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso1204e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:48:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEaGLEmJO+CtdUzLlxGJB1Otc7jI91Nms0mvMFFhXvlGn8IYXKB7SRmdSJTdGl3lUnQp6Icarq5XkCJ5HUxYkwk@lists.infradead.org
X-Gm-Message-State: APuU4Z87gYZuwVp7c2fZ+SRRgbKWFu/ljPkXYx9nyvFj6RMT2EBtvWvP
	oOk989D7bCFPoUZIjn1sblddVsvVcZIhhjm1WOwBpeGkAAVDbSIe5LwG1opLfde1bd1/DqF0YM4
	Q75rfwfW2u+uCCZJ3J9i1OxyI08cSlLYTidAgZje/
X-Received: by 2002:a05:6512:2514:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c1a21b8c88mr211122e87.16.1794944892940; Tue, 17 Nov 2026
 11:48:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev> <20261109084854.840576-2-fuad.tabba@linux.dev>
 <86bj7n1bzx.wl-maz@kernel.org>
In-Reply-To: <86bj7n1bzx.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 17 Nov 2026 19:47:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
X-Gm-Features: AclHuK-8bTfTjzWgE2se3igLLysfjqAzQV8BoEmKuQlaC_gyenaFOJ31_2y-pYk
Message-ID: <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected
 VMs without ptrauth
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_114818_262102_B232816D 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Tue, 17 Nov 2026 19:41:54 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Burying a fix in a selftest series is a recipe to make sure it is
> ignored for a full cycle... Why isn't that with the "massive feature
> set" series?

It's in this one because pkvm_id_regs depends on it. The test checks
that GPA and GPI read 0 in a protected VM without ptrauth, and it
fails without the fix.

Would you prefer that I send it on its own, or with the respin of the
features series?

Cheers,
/fuad

