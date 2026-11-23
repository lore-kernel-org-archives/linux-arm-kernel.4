Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OC1K8M59;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LlvhFpa3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P+l/VRR07HqPbgm9tEPK7SVr6Tlf5vY5XKwCiYVXpnE=; b=OC1K8M59/NT0Uq
	ay4CzrOUSmRxDO3h9PBE7BH/H7Znx4fgi1SMIPoPyGXc3ZK6c55S/lwBEDxZKDjjkF9RG1sgchUYd
	X3jISKkmLtgiHCUa8DCEktYEOO7NCKeNBcZPo0cKyEMzdYXw6cJrPilwV2p5juyyXUT/Kjw9Xly4l
	B+8WkkcIfiIQlH/szae9DDiBSgWizySKBlVxTXSGNW1iNk+hO/5bENTtRULJmXInX9nAcMg67JZgQ
	WteIoZl4wM9wIhcXLPW6k4PSDZxqofMSujXiph0wQf40GM4+Phu7Or2haCmULecvI6rD1VieCNX5p
	dzZRDeogWuefZwM5XXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXu0-00000004N67-0MQ8;
	Mon, 23 Nov 2026 17:32:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXtu-00000004N5B-2ZBC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:32:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2f04244c3d0so29819355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795455140; x=1796059940; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P+l/VRR07HqPbgm9tEPK7SVr6Tlf5vY5XKwCiYVXpnE=;
        b=LlvhFpa3/tstMNlTR2LGjRxFmpN1Ss6HWNwj6v6RO8KqgOBwgb+cEO4gcOXzjAiv82
         3ccgcpD/c+1ANnoz6YaGMsbpEFqpD7R29032VDDj+B+2ZSD+fX/r+63/E1nOG2wCqd21
         femqbtHVCGRbZaltyCsiyPHTsJPOBqlDid4azbNJOSVZHSBISylO7HXxVY0ahIwEWtF+
         LlftpZN7Uq+8YUVyKKvxqZa02Z1vUdgKR1kdrBSri5xF6sqdpzP6WZTWkpyhHPNkcUVD
         AmWm4QWkzGuF10dKKBGs+kLpIzDrQEO4CyHoEs1GHnHnAlnA8JEjPjRiwrM9Gewyp3QJ
         YTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455140; x=1796059940;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+l/VRR07HqPbgm9tEPK7SVr6Tlf5vY5XKwCiYVXpnE=;
        b=Yydf6BrYbNUwAeD3LzqEtqiMARBp5uBZDuHQrxEMNqESgAZPxxqkp/tPsMfaYms/FC
         Tc8YnAMfngcp0vOcib6D5CyDS5VKf3E2ewtmqSUnzhnJyYSV14ucS+vHKjO4cGA5/OcF
         EbpMkjyuB5YSQQypYIIQhGznwUtz0x8TTQalX9JDu6/D8OsuOfakZepdFiIDFslqAbqR
         Erk22YgzjcU8qIyEc41VvQ/ZhkjFubd+sq7vH8IyTpi83XG1iF5azMW/ixm5dBEKX5xv
         Mb2NbvVxVjJXZBA9EXschQYFaALgK4VsLkZYKmBBi7fv//n6yUypUZDPB70QD9VYzzl+
         p0zA==
X-Forwarded-Encrypted: i=1; AL+hErHuUxdrGUGqOx85UtfFSeOQa132In8se5ej0ztsjKchMEXT3dWbMWHLM6h8/vq8aTGYBlB2GDCq1lh3cz84XlbC@lists.infradead.org
X-Gm-Message-State: APuU4Z/Iuz1gbx68p/dM1gTCKmfG9sHeXBTCYWeF0+1coLBge02sEzZ2
	c2dKGn43pKor6r8u9m/hFrg8QHPbiI8nQTqHl4rD5WMjEr/IQPe4YbXzcba/sVAFUA==
X-Gm-Gg: AZFdTZc9JT0TEhUmAeaRAC3174ga1E6arSLr0pEZABukSTSbSeEp+8xSSqDJ0DK1bHz
	vlyFjMeOdIMaMSWvuzEs0HFCTU7U1wDjLh/9htZ3tL8UEZ462u7Mg+PE/oqIxCfhwnkW60zk0KQ
	UX/e9kU13YgVjENqdeXOyTkGSW7+viec0SVr8El0KOjD1q5FDTItVfOPKovjYASGZbGNDMOuwzS
	Oh4dnePXIK6p9qqDxJRp7b7a1cCs93KZAEoEkOVozyzyG1w0qiRVMgBn0gjnKn8WFiqBxYS/H3G
	zNWYqulipgkOFB/TH34NrVV1hF/yf8okurAX+E7B9CSi/Z4CrZB9jl5EbZ0VhuRRihUiOlGv27M
	6OvfcsSPqWasKwJrtv8HiBZ4b2ww9frkdb0RzfuOjxBetEh+XnJkUc7dBm8ZOXr8rEgGgOlV1ep
	dgSvzJuHD9OiV8swf0AaCD+z/sxVxL3rEOUl95OAyJXKDsobKyAxyoxnv97/Zc2oLUXL8KlNU3z
	pHE5EA0w2DasKusfe7m5sFHCGCu7fqyQVSTRqw71rLEbC/lLbQ5QNUmIvyDu9Z11wZdG/b2oK0N
	b1/QvO/WSnoZUEzF7zrTpOQGeULFgEqKyRQLM/qrx7FNUqTMthgqP78cRnD9MRkF
X-Received: by 2002:a17:902:e807:b0:2ee:1fab:158f with SMTP id d9443c01a7336-2f03f167d4emr115089865ad.43.1795455139780;
        Mon, 23 Nov 2026 09:32:19 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f051a566f7sm45650825ad.41.2026.11.23.09.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 09:32:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 09:32:17 -0800
Message-Id: <DN2RQ7LGX224.3W3PSQ2PBHTJZ@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Tarun Sahu"
 <tarunsahu@google.com>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport"
 <rppt@kernel.org>, <robin.murphy@arm.com>, <maz@kernel.org>,
 <will@kernel.org>, "David Matlack" <dmatlack@google.com>, "Alexander Graf"
 <graf@amazon.com>, <seanjc@google.com>, <jgg@nvidia.com>,
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
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-6-tarunsahu@google.com>
 <2vxzse0rzjdn.fsf@kernel.org>
In-Reply-To: <2vxzse0rzjdn.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_093222_714430_B06AD686 
X-CRM114-Status: GOOD (  24.19  )
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

On Mon Nov 23, 2026 at 6:56 AM PST, Pratyush Yadav wrote:
[...]

> When we have all this available, I don't see the point in
> differentiating between optional and required features at the ABI level.
> At the ABI level, all that matters is what the incoming kernel
> understands. If the incoming kernel does not understand a specific
> field, the outgoing kernel should just not use it. There's no point.
> Best case, it gets ignored.

I pretty strongly disagree.

An optional feature is one that the next kernel does not need to
understand to correctly restore the object. A required feature is one
that the next kernel must understand to correctly restore the object.
Optional features can be enabled without any compatibility concerns.
Required features must be enabled carefully (IMO via uAPI) to avoid
breaking Live Update.

I agree it's a good idea for the outgoing kernel to check that the next
kernel supports all of the required features it is using, so the Live
Update can be stopped before the kexec. But that doesn't remove the
need for the distinction. The next kernel still has to decide what to
do when it sees a feature bit it doesn't understand, e.g. because no
spec was provided, the spec was wrong, or we kexec'd into a different
kernel than planned. Without the distinction it can only:

 A. Treat all features as optional, which risks misinterpreting state
    and corrupting memory if the previous kernel did not properly
    validate the next kernel's capabilities.

 B. Treat all features as required, which means no new feature can be
    enabled until every kernel it might Live Update to (including
    rollback targets) understands it, even when those kernels could
    safely ignore it.

Neither of those is a good outcome.

> The semantics of required or optional then become "can I describe this
> object with the capabilities I can use?". If the answer is yes,
> serialization succeeds, if the answer is no, serialization fails. So
> with this, KHO_MAP_F_MULTI_INDEX or KHO_MAP_F_DYN_DEPTH are indeed
> optional. All memfds can be described without these, they just will be
> less efficient.

I think this is a different meaning of "optional". Whether the outgoing
kernel can choose not to use a feature is a decision for the serializer.
Whether the next kernel can safely ignore a feature's data is a property
of the ABI. KHO_MAP_F_MULTI_INDEX is optional in the first sense, but
required in the second: a kernel that doesn't understand it will
misinterpret the map. The header needs to convey the second.

So I see the spec and required bits as complementary: the spec lets the
outgoing kernel avoid features the next kernel doesn't support and fail
before kexec, and required bits let the next kernel fail safely if that
check was skipped or wrong.

