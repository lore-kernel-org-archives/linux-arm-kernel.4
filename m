Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC2C606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j1VZb4eu;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K/cUvV7f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=; b=j1VZb4eufNMZxvY7O/2P8IRfQd
	iAasBlMH6uQh28cdsiIQLSTplFGqU2dNqNvlw1sLn0fbor6z87nsuqx18iatGdMMH81bzXhrkbpkG
	42hxZ+nwXjjUW+43PTJCfBEy0hqQQsMVR88TrQhjRNaK05LqG0iSCyhmkaZzHbHbY4lfviHe0S7oB
	K481Lico+U0BfQRUoYAXf7RpznmVemOrlk09kKKwYvYFnYFBLN95NFWw5Vg4B/UL01F4YGRbP0Ki+
	J3VSGLWkiEL6F+LLXc45xyncw5deaLFS8cH9Vo0OiooPA00+nqMIV9mGZxg4p/y/9TzTMTOVuHLDR
	KYd9zqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK0B-000000065K0-3gc0;
	Tue, 17 Nov 2026 14:17:39 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK09-000000065Ir-0QFP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:17:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so9511e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925054; cv=none;
        d=google.com; s=arc-20260327;
        b=ORYU1xrJHA4xg2YQFAkHfvtTxUTHAAulH8DKgaA8GXEeBzRvfk/8rzW94pBCxRQIAs
         IaQcVdtcfk2fTOCt4MNHXVWXuzEtM+pTdJKTjqDijZ1N4kDUID0fnMsykvxGx2ROrb+N
         +dFjGagLzXIELt50pVYKlkw+9GaS244Ye7qlQnky6f8F3deMv8Hy7K6dF3zkDt7Ms/bJ
         nLXLw4Y4gC94ZwTJKx9U8fx/1DnFOz4lF0wAVG6zeynK4oyCykTBcaclENn7D24ymMk0
         GSw3YGxd8eN10Or7JeM4sRckfkKiPOzImiCQf/R7Ah9C2rjcH6GAvUoymOxSGEq/QdRa
         qhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        fh=iscnEva+/T8oH9hy9x7tBpV9jgy9Fo7Ih0Sgea8TzMQ=;
        b=TfTaRbPkcmXs0ZOQTIZx6uasPN/3gnIJt1nRmmUOEI4GH8SUiiXkwO0D1yGAYqFMxW
         pfsrm3By+bw6oWdYNwFStRhSjavhahg55IVKsEedNj7pkGFxjzN5kvsM34WaTJINDVqK
         mlDAHqJkTFcVBy0GNrYTeitsgDLj/iQJM1WhslF2r6RHL1vbhrifEVTDMHYmsxCzyK/f
         DLChsARkD6d+0URADvP3uu/8bqRqAYWnMYH6/Wnm/KV58mpZWA1dwnDlANxH+io4lHEK
         tKsgNt1CB/D/4NXtRqCRboss0g0UqZ5XHfH4tElTv3eGCIK7NXXVfSojZpzgMTKDC9ow
         wcSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925054; x=1795529854; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        b=K/cUvV7fd0Q9HO0ZVJs5WXLb95lS3n6Zbm5BA7X70rNNQj5LAvWeJI6nJ7Lecwiv5B
         Vq/S3t7MztAFTllD7EaUkfxEFj6OQu7T8XIuX6wQU/CVV3yvxglmT9cyEY3vw2Q7wIpB
         C+COxuIU8lyxqJ3bTHyGpsYb3fivqBzb4gJSXOM4v8eUaPmoMWj/4FADtsrglZ0OazEY
         J97OJcIjj6Ar9xop39mdpNOuZ58v5U6rpbplBTGlxLl4zz/g60UL8vG+ra1090MgJZmB
         vCjY7FzPWn/DB84TRp56v0ShGAg5v5Wba4SPwYp+5xik5sbYi34xy2wRehxEZkeKEfcZ
         iOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925054; x=1795529854;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BLybj40HRrk+JRnjEtELwllmhvie6n0a34/NGObtXmQ=;
        b=o4R3prKtarVRr8QBLvy/lyzEKjiusKVfi634fYny2i8RSOh/UbFpeOWPE89KRidGpb
         t1Z3fxisoMVJiQOAhcUFqXoBXee13VGkcp3A57h8TW8+G2akg+m0/4FXZa8TNvV6fRXn
         cp5FjISTd/zeYpeBf1iHFfD3vw+Csa6qS5KJc8Ojf64lQ7QukesPuJEYWe8bIlQemDmg
         b228GhyU+Q7UcMZmG6G/bDXLhPxSUNDOx845SbLxnBgoifYwqBPPXClI7oWoHVT6PYPE
         t8Yoz7RkXiqBcqy58yAJNbZx33ibYy7GjGWcP+LMHR7e42b2VvhfClwtQEe0j96/O2rR
         uNFQ==
X-Forwarded-Encrypted: i=1; AL+hErHaOhSWxR6utE8SWABmuntAz+EWjuVSk4Kqn4uGnjVMSzWN8qPq0T/E+j6jrSrJPFl3Ivda8FIqHCdUP1bC8k6a@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZleQAs969fEtO5BIJAa2wt1RRoY6uhmNS8K7gXF24H+AzvOaq
	fXhPu1hlPuJxfr0lawqHDepnzfnzy5gxhUgDwkE4O54IxyPNNm4jS1MBNLCP01w5sTKtdBrRO9n
	SN1bQ8Cru4VgvoPYLEF4I3V4vQINaDYpAS/g3MNaH
X-Gm-Gg: AYBFou2BBezGzwa8cJg+NiiwasesaVL8plFPG2fHWuENiCmaRoJQ32vKY3JdV86fhwo
	pO/vj+x44CFMLQ+8VLBFSIrHl9wkKL4455oU06m8W9zmkvELmIfvQMDXMpUaNvx0epw7Vfd07sh
	y4jbeIV77YSla9ADvKCekrN6SulGQ9VYA122nyXDsgb50X4LTzLHm5XatMMSEsi6uE8IPw+k1Rf
	rnMmvE5ZAqFF/aJHfl1DfKbNalEROMPr1lpGUmPWgR5HRCJtMIsdasP6pewLMkXFDcIcZDiJF3y
	h0v1WX68MNF64UEx3ezd+xFCrUmALdHga7DNQNOtiw7VS1G6pQxlDNidn7IWfI4TcbayZFmml9W
	CUR8tWtmd6M0UMIvzS0dHLRCPL3u+tMkHRZAKRUHBGyrc7eEmMA6o9KTAFbdvRg2QO+XsiVNH28
	Ct1RRotLeTO9E6z+UiDffjrDM=
X-Received: by 2002:a05:6512:1320:b0:5bf:f060:c0f3 with SMTP id
 2adb3069b0e04-5c1a218237bmr141450e87.12.1794925053973; Tue, 17 Nov 2026
 06:17:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-4-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-4-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:16:57 +0000
X-Gm-Features: AclHuK961RRQGs05YcwTvTpXpMcWfGbS65nrobWrGykL5gw3Ev5XjAPi08pa1t0
Message-ID: <CA+EHjTyeE0gbLgfiDePPVRR88GFVa7G-G8sr8k6vzM7v_uHxdA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] KVM: arm64: Handle attributes in stage2_unmap_range
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_061737_160963_F575E6A1 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 16:43:49 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> With the introduction of private memory support, we need to
> handle invalidation requests with filters for a given type.
> Add support for passing the attributes down.

nit: what this passes down is a filter rather than attributes, in both
the subject and the message.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

