Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F5B606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fqEQZW36;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CzI5BMaW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vmPlBJsxyoTZOO9g2mmGNuUfH7b/frSSah/ZWuzVmhc=; b=fqEQZW36rvvFu6
	+vUlqoILGMNAL0n8A6VPV+0jReHCHPgdQtTPmq0qv3x9fHfj6Xz+/hp6fLT81d8Ccf5h44RWYEuo7
	QgnKBa0cJ4OHbZAIQtQMRkbiKOc9sWI8WqJo6LpccoeByhM1FMc1QNBbmf6S7gnJSGAwyGicidL8n
	aAYyD0wZd6/jVsQGSwMV9bS1zRSebOItxBIDYDS3yJWRTMc/SmtDAvTmUKnXXn8c32AzHw275kgT1
	8iJ4ny7/vRyJ82q/NtK4A8wa17d1mb9bhWebBR/VkKiuRBqwqXRz1lTw0XtKFsmV2HJ3krTIDfXBK
	pwxBViVZnEqllC5leN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvma-00000007Ywn-0lgB;
	Tue, 24 Nov 2026 19:02:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvmT-00000007Yty-0FMT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:02:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so3146644b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 11:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546935; x=1796151735; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vmPlBJsxyoTZOO9g2mmGNuUfH7b/frSSah/ZWuzVmhc=;
        b=CzI5BMaWuC0hQ9uIuLTKOn/jybCILgpABGJVJVudIarMPGIgjcQODq5YGD26KqPOxQ
         89G9s4FL89fkUH456Urw+bzmvFY2kShE8YQWgEcRLkhbvhnAT5FXVTC34H2mh+oYm33u
         ie031oaAusPA7djBsIXfJMHjDbPH596vClQXvtpirKe4ME/JzNc6wY7oyMEQiVreBI3p
         Jbzra6t/VpXdic1yWe9Na3htLakf+Bnv3KcJkQz7dK4xXyQHdNo6WZxWKg1pRWJKyOQh
         K9u2VNBFOgr5xuofBRsPIt2BylxPj/ykVWkb3VFEChpYr2RDJrUMhtJmD5EvybupDHwA
         YaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546935; x=1796151735;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vmPlBJsxyoTZOO9g2mmGNuUfH7b/frSSah/ZWuzVmhc=;
        b=M73Qye4uDESHTpEbq+pY/BT2IfrlkzGyLaEvTYHCNseGHoImNX77e1yFvfFAuayZC9
         OAWm0YMZkzdIFwiouGSAgbIE+XwybsErR9Xo6adi/yUdwIwDtwjuUH9+kd0lU2p1wjvb
         LodiRaEzmYmAlSvTWtzuHdsxEmDLWZcObl0V5uY+xOm7YtKUw19Ofuf0KTWFwmJ3cjkx
         B/6Q0taVjs/xPu2a3aXI9/zg80v70nkqwOwwKoWp5ySYwCoH1Y8vYMrbK78awtBFtrPr
         ZFQOyPE+tqPmkBXICCGQ4PHcheAYArEHmVnccqpRF1QJSPE3NA3VjxKBvnobu9A5yDA3
         Otew==
X-Forwarded-Encrypted: i=1; AL+hErEw75ckVrL/gOjDabdQCfCHmxnWoSzv4jqEqKW9FxuNPwrqvlMgEw8jD9nIaBa3TWa9gj6uQev1xZ6hnu9Q47/f@lists.infradead.org
X-Gm-Message-State: APuU4Z9dmlQTZsmuXOAYKJwRwLfKBqqrJ3hukTcD3S2AUXxFJBTOrlup
	ikheUQtP+3Rt6A0kVR8a04ylVMUqLLu/tS6iMiGxaRcE2zDZLcv6fOFRh2MCniis2A==
X-Gm-Gg: AZFdTZf9xZPG+eUvmb1OKCvlflzTgi2DVEtVWme5xnC/7vni0MKGrEWp9U+BsgglQeo
	+VGIt4TTY+4eA91FMiouf0RPDu8RyYNvdUM32zzPgK/sTBw18tJR1R9yoMuu0YSYTCOlXLUR0wW
	BCk0NudDq9pGSSfNt5iDgAWMVm2Q1Gyvd98Tp9Jvqa9O2DrELBPbqwaDLgMTtNKtbSj3rAnl+PC
	tHPfXV/dysZYI1dFIKvinf2+iFw9svZW0FvY9rbgyCUmsI7GmODZQloEaBnWuWJsTSyukwx0UkV
	IB7esMCZ2O7M6qeftLvizoOZWcQHszayK26TAOeCqL1QOl4K/vk+I6/LwYRyhI0Axk52WkuLv8g
	3cV3015ALR4fELUzQkbd7nafs/WPX22X+S2B7XPVeOFKrrkGx+VUo9WzqvNw2tkGpSYG54NGDUR
	Lm6LtsNtnfETzuCRIJ6RIUj8pUUQlFZ7WLnGI1fM4ytOo7bzLXFTkqy/5/pd9I2osX2KACjbMUA
	gR3J6u0tJNa57TZ+8MO/LON7yQAl7Meawrsfg5PWGUqX5LFNq4B/8QjZ3xlkWUSyK8C70ARMz9T
	Dlm+YzBAdWVQmZFIkZFUvRzTpQcVYvpNU1+/shI7AQ2EUmcyOSqyvBR3fHmDeepFMw==
X-Received: by 2002:a05:6a20:a11f:b0:3e9:f2d:d556 with SMTP id adf61e73a8af0-4014ca44d17mr16159174637.55.1795546934090;
        Tue, 24 Nov 2026 11:02:14 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde9bb05981sm2247135a12.26.2026.11.24.11.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:02:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 11:02:12 -0800
Message-Id: <DN3O9LHR4XNH.1EYLA6D1F0J2P@google.com>
Cc: "Tarun Sahu" <tarunsahu@google.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>,
 <robin.murphy@arm.com>, <maz@kernel.org>, <will@kernel.org>, "Alexander
 Graf" <graf@amazon.com>, <seanjc@google.com>, <jgg@nvidia.com>,
 <loganodell@google.com>, <arnd@arndb.de>, <dwmw2@infradead.org>,
 <baolu.lu@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <oupton@kernel.org>, <alex@shazbot.org>, <gle.com@google.com>,
 <pbonzini@redhat.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 <kevin.tian@intel.com>, <joro@8bytes.org>, <kvmarm@lists.linux.dev>,
 <linux-pci@vger.kernel.org>, <kexec@lists.infradead.org>,
 <kvm@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <skhawaja@google.com>,
 <sagis@google.com>, <linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 05/19] kho: Add feature header for fine-grained ABI
 compatibility
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-6-tarunsahu@google.com>
 <2vxzse0rzjdn.fsf@kernel.org> <DN2RQ7LGX224.3W3PSQ2PBHTJZ@google.com>
 <2vxz33sqz1xj.fsf@kernel.org>
In-Reply-To: <2vxz33sqz1xj.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_110217_119439_8BB5907B 
X-CRM114-Status: GOOD (  15.77  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Nov 24, 2026 at 7:25 AM PST, Pratyush Yadav wrote:
> I don't think it buys us any functionality. It just hides the problem in
> some lucky cases.

Following up on our offline discussion: I think it's worth keeping
support for optional features, both before and after the spec changes
land.

Before the spec lands, optional features are the only way to enable new
features at all. For example, the PCI follow-up series [1] preserves
BARs and bridge windows using an optional flag. It's purely additive: a
kernel that doesn't understand it keeps behaving the way it does today.
With optional features it can be enabled as soon as it lands, and Live
Update keeps working in both directions, including rollback. If every
feature is required, there is no way to enable it until the outgoing
kernel can learn what its target supports.

After the spec lands, optional features are still useful, and at worst
harmless:

 - Kernels that predate the spec mechanism can't provide a spec. As long
   as one of them is a possible target (e.g. for rollback), optional
   features are still the only features the outgoing kernel can use.

 - The outgoing kernel doesn't need to consult the spec for optional
   features at all (less complexity), since by definition the target can
   ignore them. It can always produce the same payload, and only
   required features need to be gated on what the target supports.

 - Nothing prevents an outgoing kernel that has a spec from choosing not
   to set optional bits its target doesn't understand, if we ever want
   that.

The cost of keeping them is negligible in the current design: the same
number of bits in the header, and one range check on the incoming side.

The one rule we need is that optional really means safe to ignore, e.g.
optional data must not reference preserved memory or carry restrictions
that the next kernel has to act on. Anything like that must be a
required feature.

[1] https://lore.kernel.org/linux-pci/20261019213054.3157159-5-dmatlack@goo=
gle.com/


