Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30303606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J0Pm2UsD;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YLcKuVBi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F1guWKqhMIdnhcOOY/GSOXPqYFIOugPZ2YwxBRVxVK0=; b=J0Pm2UsDIps1KNRuBYDVf/PEl+
	uZy1KgHw6+su8iHymR7V3BzhY5neX/Sfvm8MEjKD7cmb3455lV1bE4fP62AM3XZvXVlgdm5R2Qghs
	rnG4RLm9LZMAyjtDYqKqyGqyXGQvA00MxR9o1/0mHBiuNNIGhWJujI3Mkkw1rtsEgFb+ZNJ8YTy/f
	JivTYAvDkzrQj7dUs1VAC/TZw4TllMNasCzMHE4PWXkXoAl0SeA3QN0K5yMGBDMhho9arPe+gT3Xo
	f0/Zg99MqR/XMrzTAhl4y/iNOrUh0yOyavzJNmhv4j1Mv5ktI7XHoLbE6dGc91/Fxj522hyWzmyim
	2hHTq5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx1w-00000007iF3-0BYc;
	Tue, 24 Nov 2026 20:22:20 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx1t-00000007iEh-2RbF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:22:19 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4c467e19391so7288263b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795551736; x=1796156536; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F1guWKqhMIdnhcOOY/GSOXPqYFIOugPZ2YwxBRVxVK0=;
        b=YLcKuVBiFAed9ttEzQjp27eewlQY4Gw1kVJcPcSVezzn2PG7CxIK2FqX5AzjYSKoJ0
         Kk1L41Wx++VfSKwIiv4luP3cuxvovR2McivB6qdvVJ14enRq0AB0dgGPiaslhruLcIDP
         R++Ay0YAEsQ3JxVJb0FW5TiTeFhP/pVVvORrIvgFTNJf6sseS37VU9OWa/Pd9Nns1iGy
         TPjxSkjb3HyJjmnktL/8O1SnzMZPOJIn+TjXLGhLV5EP/4ezWDcZRf52Ry4KavrmyGoT
         Y1zOGXm59y/07VLTD5o1662KL3ydjxQt9UZjOMdnPwkQ+8yXna5i0oMqWQfnyIpSdd3G
         ftvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551736; x=1796156536;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1guWKqhMIdnhcOOY/GSOXPqYFIOugPZ2YwxBRVxVK0=;
        b=evu5h8eITyXE1Gt98a3vdSXLTIjP8AASwrk0Q1FxktbP7MeDs2b75zStzWUNiPgZUr
         BicDhPvfokSIWNTz84V/bFO7SVsOdIzXcN0NAm7D5m5kCtVdz940Ekpv8cViGXEtgja4
         QtnQY/Ecz4OgtFMaAX9aVyjXXXQCu8g6tL96eEJiQws0Sm6FRS0dpUG+yTZQ9JTMh2mw
         pgpGAZgDpOAecXyhK0I1eZ5Ap3IUtjVeZxCgaIu9soVhxGRL+yLL93jmnMd6eZrGw3F8
         rBJ1wnuDZNRZLnvP0zd1B7KzJciJx7wulB1uPvTUHo70Wq8BodQ+5qePPF4JjDCkmH42
         AuMA==
X-Forwarded-Encrypted: i=1; AL+hErEcvp65UUCeRq4d+Ma7//FyeYCzXs7ay6lksAIsVgySTOfq1xPOmQqcCGWSQ5N6CrPEW75PXnLV2PpMckrGceCh@lists.infradead.org
X-Gm-Message-State: APuU4Z+8F+lToHgNb2xwyYw30sLpCTgNw0lT2xp3SiC1RbppDGAVFqvC
	qGUGA23bpTG69Z266EwXtebuJnNiS7k2fKuhbCrdrALxt4IWdUYLIGlelWp8quXNRlAbnS152qG
	vJvCIGytAe3o3QBed/YcaVdT3Ew==
X-Received: from ilmw6.prod.google.com ([2002:a92:d606:0:b0:53d:20f2:6884])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:e8c:b0:4f3:e98f:fa27 with SMTP id 5614622812f47-57a09c1107cmr18109738b6e.16.1795551735576;
 Tue, 24 Nov 2026 12:22:15 -0800 (PST)
Date: Tue, 24 Nov 2026 20:22:15 +0000
In-Reply-To: <867bi2z87n.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261123232647.3733149-1-coltonlewis@google.com>
 <20261123232647.3733149-2-coltonlewis@google.com> <867bi2z87n.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124202215.3731849-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: nv: Discard undersized TTL hints in compute_tlb_inval_range()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_122217_621789_108336E7 
X-CRM114-Status: GOOD (  10.37  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 13:10:04 +0000, Marc Zyngier <maz@kernel.org> wrote:
> What's the advantage doing all this dance over the patch proposed at
> [1]?
>
> 	M.
>
> [1] https://lore.kernel.org/all/20261123182312.4842-1-maz@kernel.org/

[1] only catches TTL hints smaller than host PAGE_SIZE. It does not
catch a hint that is >= PAGE_SIZE but smaller than the mapped block,
such as a 4kB L3 hint on a 2MB block on a 4kB host.

I can rebase on top of [1] so it goes to stable on its own. Following
the same pattern, compute_tlb_inval_range() can check
mmu->guest_s2_mappings at addr for an entry larger than max_size and
clear it to 0 to use the maximum-extent fallback, dropping the extra
page-table walk and KVM_NV_GUEST_MAP_SZ check. Would that work for v3?

