Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88417606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tHy0P4Im;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wa4HDAI5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Mw9iOCkEBWkvxdLSgoJVCB6jT3T4ThA8jIPRTFH0lnY=; b=tHy0P4ImF1f1/+
	AivCVRhZb50i4161eQI3LqlpKWyXRPwYFpaLGn5ocaQiqCpcJDzIBzYDdGip9lLLFDULbwWSwILLg
	bQ1ASf4GrNwV5KoWpcCmp6Y3TOPmHI34Gb31H/mBT1x23B5eX2lini0lTW+ZvmvSbPXiC9TKA0NJm
	i4wn1v/U7vuZoTEZ9kOBXERSqE4aAJT4ZkTMVWyf/aCvsUS95eTZ9ojsV32qio1F2IeNTjRs2T66K
	a2nFif3Jh8kkMR/0K6SzPwC1Mx7OJm6/CchAUMLeAARHl6jzzGGBl+0WwAjjlldoxmwspADLXKeF2
	OFJVaE6RKiuJrRJGbbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQodc-00000004VeM-2mWo;
	Tue, 10 Nov 2026 16:24:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQodZ-00000004Vcl-1JTV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:23:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ed1e9ae5a8so7656775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794327835; x=1794932635; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mw9iOCkEBWkvxdLSgoJVCB6jT3T4ThA8jIPRTFH0lnY=;
        b=Wa4HDAI5a8JZX1jkFBmDL3IOm984ooueuf5MYWN01KvWChiygdRkOi7VWp8vAPmHBj
         ABuRZWhboj3K43Pr51fp88PyoYIWkq0b8gj3bW93rBVB+Hij72fJa8FyB1ADGr6ZyzkV
         MjkJSzsZI7UwX5rqmF2pIkD4Cs+Hda6oCn0rzRR5WY2Qcn5i4t61JsHbbkK6/rZYBM9m
         5/2yYKlE7Owk23rQZzYvO1QNwG5Bx5Ri/3Ixi4t6qhs1NCHyguyXvmtLqAIKOwNhfisS
         mMHMot4s5ovRTraDPXGaWniYAKEcGEvPnG2NyU2AN1MnGbhgmDZiRaNr2NZCDDG5jZdE
         DlKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327835; x=1794932635;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw9iOCkEBWkvxdLSgoJVCB6jT3T4ThA8jIPRTFH0lnY=;
        b=yDoMCnXt2D4KvFctioI87kvaH40kBsM/ybmlXKq/VDNNkrPjx3pj8+rPUrR/aQEFP9
         p9Fb8MzIIZ+z5o6cKjGUrH84crc4qppCM1KxvoQxagXq0xKeNTBWsPrZkMmS3kdbd81+
         eG1BKRDwa4C5l0qXSqss4aWacV0diddWQHbcF88fAaos12P1wEbv7Bi8fZi3bsgGg9Sf
         cC+Fsgd0cVlNTfRGMIFAkUa0Se5FhMkcXGPyfjC/auwt6lyd1BM3wodG/ezFR8Ayv+ju
         PiZlfzHp8PTqlD4LT19NQt4pCa0wJe7qWQYe8vZeWd1h9GFqYm5sVyQ0Y1BsVhmtNB44
         HWuQ==
X-Forwarded-Encrypted: i=1; AL+hErGZfFXp1csxf6h1FEYpfK/C9bWdBiTckSeWF9qN1zAk6THSDBa8S9W6hfCANzq7jgWnzOnhhAru9i0fTSwCY1NZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+vAMEfMW1Iw89psoqJUk2UVYXpxKsh9ME64q2XxqRfqkf5HlWg
	1IPyiHBYPWKbo2c99EKRyijQ14cZSDcibppAlKhHqxlEYYJzom3d7wY4uRSDRXHQlw==
X-Gm-Gg: AYBFou1EGDdsHnmC4D3SlKs3e9UnDHez1eYdZqwkJ6gkJlGcjRtnlTfynuPhgxknbdv
	llwAaQgMMtuQUq9qFiO8ClgSw9SzQ6TQVH8xKBeJADba8AHTILgU2ozy/PZwMMVEKCz9ZsycA3C
	Wxa4EMHhZ3cxkuKFoNDO/iiRRdT0EBQ/RWF8+kXnRmuNdHnE/cenjItsGyYDGMpFKxO6njWetRK
	lHvZDGWumdyR3irB5s3h0cuEIO5uxVziAxmBpVhW1RjKuGC0TW0pqtCvrIYX4hjuohMexS/Lg9g
	w/HB93i//KHmkI51G0o3cLXTI5ULZwEwGF6yZSIvNGz5DxAbp1vn8sxHyUC2/NL4es3N0aBLslY
	ml2GcUmr3pFKk5Ej1ylIJbdquRYBSJ+qgxti28htYs0gkXG4B2mw7ClypebXE/vFrpvH+3LKfbn
	O/6uhKYbWNzn3GSIAWm7ER6u9wJBm+Vp7F3t7UMMpZ8mfir0gY+EY8cMPB7NyqmthRFy+OuEL+4
	z84GhVmr1+3oKYCKxUt/6h67mBSIEzjEC/VnJimzJsECHp0pKkTfs5m1cKKkmfx+KEzkVVoodtP
	SrJBdVvbGx4jKU8+kjAf6LcYyiIVUnQle2U8OR6ssMlMatIhMiB3tLMtpYbaGiL2
X-Received: by 2002:a17:902:d4cc:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2edb9146ba8mr28990585ad.14.1794327834955;
        Tue, 10 Nov 2026 08:23:54 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7d964sm11306915ad.32.2026.11.10.08.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:23:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 16:23:53 +0000
Message-Id: <DMRO4QXXB8H4.127C1CPT3RZ18@google.com>
Cc: <kvmarm@lists.linux.dev>, <linux-pci@vger.kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <kexec@lists.infradead.org>, <kvm@vger.kernel.org>,
 <iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <skhawaja@google.com>, <sagis@google.com>, <linux-arch@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 16/19] PCI: liveupdate: Add feature header to struct
 pci_dev_ser
From: "David Matlack" <dmatlack@google.com>
To: "Tarun Sahu" <tarunsahu@google.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>,
 <robin.murphy@arm.com>, <maz@kernel.org>, <will@kernel.org>, "David
 Matlack" <dmatlack@google.com>, "Alexander Graf" <graf@amazon.com>,
 <seanjc@google.com>, <jgg@nvidia.com>, <loganodell@google.com>,
 <arnd@arndb.de>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, <oupton@kernel.org>, <alex@shazbot.org>,
 <gle.com@google.com>, <pbonzini@redhat.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, <kevin.tian@intel.com>, <joro@8bytes.org>
X-Mailer: aerc 0.21.0
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-17-tarunsahu@google.com>
In-Reply-To: <20261110050202.529473-17-tarunsahu@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_082357_362485_378CE14C 
X-CRM114-Status: GOOD (  17.67  )
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

On Tue Nov 10, 2026 at 5:01 AM UTC, Tarun Sahu wrote:
> Precede each serialized PCI device entry in the PCI Live Update KHO block
> set with struct kho_ser_hdr via DECLARE_KHO_SER so future per-device PCI
> Live Update features can append fields to struct pci_dev_ser without
> breaking compatibility between adjacent kernels.

Elements of a collection should not have their own feature headers. This
applies to patches 10, 12, 14, 16 and 18. I raised this during the v2
discussion [1][2], but I don't think it was addressed.

All entries in a KHO block set are written by the same kernel using the
same struct, and the block set has a single entry_size, so every entry
header is necessarily identical. They don't convey anything that the
header of the struct that owns the collection can't. In this case,
struct pci_ser's header can define features that describe fields in
struct pci_dev_ser, and the PCI core checks them once before iterating.
If a feature only applies to some devices, the field's value in each
entry says whether that device uses it.

Per-entry headers also cost a lot for small entries. struct pci_dev_ser
goes from 8 to 16 bytes, and to 24 bytes once the first feature is
added. Patch 18 does the same for every preserved memfd folio, which for
a large guest backed by 4K pages adds gigabytes of preserved metadata.

They also add new ways to read out of bounds. kho_ser_payload() trusts
nr_required/nr_optional in each entry, and nothing checks that the entry
header plus payload fit within entry_size. In patches 14 and 18 the walk
uses each entry's fhdr->size to find the next entry, so one bad header
throws off every entry after it.

Instead I would keep struct pci_dev_ser as a plain struct, take the
entry size from the KHO block header (patch 2), and in pci_flb_retrieve()
check once that the entry size covers the base fields, plus the fields
of any features set in struct pci_ser's header, e.g.:

	entry_size =3D kho_block_set_entry_size(&incoming->block_set);
	if (entry_size < offsetofend(struct pci_dev_ser, refcount))
		panic(...);

That also restores the minimum entry size check that the v10 PCI series
had with PCI_DEV_SER_MIN_SIZE, which this version drops.

[...]

> -	kho_block_set_init(&incoming->block_set, sizeof(struct pci_dev_ser));
> +	kho_block_set_init(&incoming->block_set, kho_ser_size(pci_dev_ser));

This size is never used. kho_block_set_restore() overwrites it with the
entry size recorded by the previous kernel. Passing this kernel's size
here is misleading: pci_flb_retrieve() (and the LUO session/file restore
paths) read as if they iterate incoming entries with the outgoing entry
size, which would be a bug.

Incoming block sets should not take an entry size at all.
kho_block_set_restore() should initialize the block set itself from the
incoming block headers, and the incoming paths should drop the
kho_block_set_init() call.

[1] https://lore.kernel.org/kexec/atl6K2Juy6Bh29lh@google.com/
[2] https://lore.kernel.org/kexec/at-8vkVpN2SF3XgB@google.com/


