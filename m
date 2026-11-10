Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723F760A3807
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DOpQQ8PC;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=IKsXlgdz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WKAEhFQ+Dah3DMHVjGDEQ1FI4504gN8wbhTTvAQenls=; b=DOpQQ8PChStmvw
	9AITwFCioHWlilwdYH4QH40egztKhvbmF91JiKXh/DJRDzmUzKS5dWDabgp6PDlkKR4cNFFhK67Th
	2Aimb/fBZrdS1hmFTKsRR2Tp+SVuq0n7X7ChkIg7i8zzoHQXIl8CvnAbBgryfZPXFIFcsKxD6b28c
	eIurAiLkVUNdWiKneOv3ezVVaQE1Q8uxfAg+2RaB+G8X70k874zkjTcOW1EfTz7WdSNUBBk3mMjAX
	DKO9FOcHQQWY8L+4QBy13lsLExV9ETQD5GFNypSjhDXKCth6Q5pCL2pvRYwXI+JN41YaVSh+1TYbZ
	W3s4oUoZVP9BeRg9S6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnSS-00000004Jrh-1SkO;
	Tue, 10 Nov 2026 15:08:24 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnSP-00000004Jqn-2eqo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 15:08:22 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-9908c849564so582036241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 07:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794323300; x=1794928100; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WKAEhFQ+Dah3DMHVjGDEQ1FI4504gN8wbhTTvAQenls=;
        b=IKsXlgdzhauBXkvQT1ySs13NZ9LbxMFk6Xqy8vxqYlxCDlFPbo9kRKtq0WW7o+96Jw
         mLKl098O0zKhLbSfG8KTR9mYRbZHf3Fv47Z8VML9RELSrb6V2Ep87d7IGxmCr7pm4BCG
         mN1Xp5sBStMpM0iqAkFYNtO6iV3I5jXhcrLGy47jiPq86KAIaSC1p1ZCArMDxV2n3CMc
         dz9M2sZj2LYg6uBzpkUi0KDegrAP1ny+3r6QQkSHPzobzoNrwHLNodFCrftib6Rs8n7D
         jlyUhe8gm5ALfqm9fhedPX4ne+/tuVwsTQcyZHI5BG10NXCyAGRVvpCA9J5GMt1Rahmd
         pssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323300; x=1794928100;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKAEhFQ+Dah3DMHVjGDEQ1FI4504gN8wbhTTvAQenls=;
        b=EsQl6rCAXEiXO2Bjpz1qSgWoRynt9LMokPNi5nJCrnchcYxp6SH4vqMV08qDCBwN2e
         W7hcGOjUCHikr+kCH3OUlvuugZMOamVNHHsKFqOf1PWMA+6vIPoz3/N2aUPz+0CAANvP
         Z0i3Q9m00F15hI5ActeGLZcVdRSfcyg6WB8IAX7Cu4A6BlnYRAjVHrAEgt1Xn+fYP4E6
         Z2KvOqGXNkZ1/aazlvCfDwCxplheSu2dpZv/zMz3SnF+Mk5veb05CG8DaJf0QZbi2TeE
         VPxyAPSjX5FbCZwXeuWJ0WV/l4ijVejvqDVdneBN+cpIjcscJq/cPB91BDArNQY2H6iO
         0mpQ==
X-Forwarded-Encrypted: i=1; AL+hErFlWwrH98zIpUbxcbnhPrYzJm+MQPqZTPsvU3k89CDDrjilGmHfAz4vg7qhYV9+e+XYb7kN6nCmOooRQncAvdm0@lists.infradead.org
X-Gm-Message-State: APuU4Z9ViPCt1DX4iai/CABMio7q5g/WqX+30ueT2XQA4OEXh3JgXlS+
	hq4fPL39WLToU33eOgli+14BFam7PvLYO8YgT2oR9WrtlmQn7SivvctJLtFBlDQFSb0=
X-Gm-Gg: AYBFou0VYaxp1a6WJjWf2qDR6RASe+Zbb9z8NY6K0BnlGqd5OV5Sr1SRRRuybo/9fCx
	5VeRH8UXhlAAVHQyx+Zgww2iPYYee+H+5BQW7w3fxu7+SHunsXwMcXD+yjc1u9zK6nQ1Qb8KGEc
	TmAvmKMh/WAJunPCoxpiSIVcAd5xVxmiEdTyYMtzJcgHlqS5hP0vEHZ34sUqdrR3s0p15MEuSLl
	IS/8fSIRhGzkguV9of7X+q8l21ZNWDwwSwKR64qxRUiyz+M/RmJHyAh2ycfPZWLwyP+q004RLXS
	wS392h46K5ntsv1YzmujQ6VwfmFH7ejWQPJ6joViG9gt17xc7wbAcTlQl7VyogjmRpBmP0rju3G
	hUKBVaECzlUYoJzv1YfA+Zak61WA3P2PYREZiIsiOPGSzF9PGdPqQvXcqRC5ljwz3syrSCADEcD
	7zIvw2PX6dazOkLOH3uDlCA3TZXoGrnTupf1T8pSnRMsTDQ7C9X0WjQmRvKr6q431DzsKrYNIZd
	V5n+saXGfqFhyuDnpqiE2mjlARJYa1/1ihwA40l9CRWl05fRf4drrOBNClO8+099fQB31/2E8lE
	WY86FNUVuC3KGMWrdZLZyPb20VICO2sLP8RywMf+Me/WpocMSfXrAdxqQyiLIUPvQ7pEj55/nWf
	CRmw+rOTbVQU4cGwAfyVxZGypiCk5nskzborXfoPLRxWv
X-Received: by 2002:a05:6122:468c:b0:5da:a74:d6a4 with SMTP id 71dfb90a1353d-5ee0d1254cdmr983516e0c.15.1794323299946;
        Tue, 10 Nov 2026 07:08:19 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe63asm1965122241.4.2026.11.10.07.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:08:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 06/19] kho: kexec_metadata: Add the feature header
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, maz@kernel.org, 
 will@kernel.org, David Matlack <dmatlack@google.com>, 
 Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, 
 loganodell@google.com, arnd@arndb.de, dwmw2@infradead.org, 
 baolu.lu@linux.intel.com, Bjorn Helgaas <bhelgaas@google.com>, 
 oupton@kernel.org, alex@shazbot.org, gle.com@google.com, 
 pbonzini@redhat.com, Andrew Morton <akpm@linux-foundation.org>, 
 kevin.tian@intel.com, joro@8bytes.org, kvmarm@lists.linux.dev, 
 linux-pci@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
 kexec@lists.infradead.org, kvm@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, skhawaja@google.com, sagis@google.com, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110050202.529473-7-tarunsahu@google.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-7-tarunsahu@google.com>
Date: Tue, 10 Nov 2026 10:08:12 -0500
Message-Id: <179432329215.2329176.14453669404153142360.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=QPKh6oqVuep5a0uq5kk2HJ+pkn4UzCARnNzVJdUZk/E=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8zNhLa8G7KPQhtpqNqIaC7iUSrItiw95IH4+W
 4FZp+mLRNmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavMzYQAKCRC7dyhM23N6
 3ixyD/9hSlVPu6pn+Usl6EKxRh1wkp2nNTAGfSwd0T80brdKlRNG7a8mQqhUQi1H7cXmovyHBUq
 ES73eQCtV9EEqD3V+9mhbM/vQ3DNxapFoBftgUpOKocv/TyzS+fnYCCd+V4qkZp6JbEE04DX5ph
 RXIIzYY1cOoM3lIFUa3WAKuQ5IlLTqUrcCnmCGDDA2ABc3Dn4YGxVfA+j1TEgs3i5/pZ3Jg6vPm
 2w2Rki59ZZh1OvjNwqaQcNxFUaUzOua2A1T1C5uWqXUw29+H364g+FPC9TsTFighlf5Dm5nInFm
 sy05T7yV7PmS1d4eRFn5VjWQo2hboOwrVmB5E3sLTnbZ+oXkY0TgWbPqKYlXfKYQ1RF1dttkf3y
 L666oJVxxNOxQuWbB80WyaaQp1G11CUhLjsRBaxuJqYWD3LuhT6NKGc7rkKJ+4Y1QHbv77qrsL0
 xU62OLvV+UYlxbDgjPM1r4q1njY/2zmio3uMBSt4oubrAmtiUMAW6J6dY86mFHlcm8xgbSUbn5B
 HOb83UbLMhoMCV4Zf4R9ofmr8Zb5PO+Ieg4+UAv33DElEYGHzsZJuh7rv0KDrtHn6JA4zqY3vNY
 KpfJSWU9gzyoa94bAOMSWiRRC/83AeXcMfiQw7G8I+bNVH6Sm/Q6RfvqXkiiTkw9BXIWwqNbXQH
 2NBA/068NaYZqOw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_070821_692153_9FBF6521 
X-CRM114-Status: GOOD (  24.18  )
X-Spam-Score: -2.1 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The kexec metadata subtree currently uses a monolithic u32 version field
> to identify the metadata structure layout. Any change to the structure,
> even an optional additive field, requires incrementing the version and
> breaks compatibility between adjacent kernels.
> 
> Replace the u32 version field in struct kho_kexec_metadata with
> struct kho_ser_hdr using DECLARE_KHO_SER. Later fields can be appended
> under new feature indices without breaking compatibility across kexec.
> Also make the 3-byte padding hole between previous_release and kexec_count
> explicit as reserved[3].
> 
> During deserialization, validate the blob size against the header size
> and reject unknown required features. A legacy v1 metadata blob is
> ignored with a warning.
> 
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> diff --git a/include/linux/kho/abi/kexec_metadata.h b/include/linux/kho/abi/kexec_metadata.h
> index e9e3f7e38a7c..316b3e5ad01b 100644
> --- a/include/linux/kho/abi/kexec_metadata.h
> +++ b/include/linux/kho/abi/kexec_metadata.h
> @@ -18,28 +18,31 @@
>  #ifndef _LINUX_KHO_ABI_KEXEC_METADATA_H
>  #define _LINUX_KHO_ABI_KEXEC_METADATA_H
>  
> +#include <linux/build_bug.h>
> +#include <linux/kho/abi/feature.h>
>  #include <linux/types.h>
>  #include <linux/utsname.h>
>  
> -#define KHO_KEXEC_METADATA_VERSION 1
> -
>  /**
>   * struct kho_kexec_metadata - Kexec metadata passed between kernels
> - * @version: ABI version of this struct (must be first field)
>   * @previous_release: Kernel version string that initiated the kexec
> + * @reserved: Reserved for structure alignment; must be zero
>   * @kexec_count: Number of kexec boots since last cold boot
>   *
> - * This structure is preserved across kexec and allows the new kernel to
> + * This structure is preserved across kexec and allows the target kernel to
>   * identify which kernel it was booted from and how many kexec reboots
> - * have occurred.
> + * have occurred. Preceded by &struct kho_ser_hdr.
>   *
>   * __NEW_UTS_LEN is part of uABI, so it safe to use it in here.
>   */
>  struct kho_kexec_metadata {
> -	u32 version;
>  	char previous_release[__NEW_UTS_LEN + 1];
> +	u8 reserved[3];
>  	u32 kexec_count;
> -} __packed;
> +} __aligned(8);

Why __packed was not removed in the first commit? __aligned(8) should 
not be needed, given that it must follow DECLARE_KHO_SER which is 8-byte 
aligned.

> +
> +/* Register kho_kexec_metadata with KHO serialization accessors */
here and in all other places, please remove this comment.

> +DECLARE_KHO_SER(kho_kexec_metadata, 72, 0, 0);
>  
>  #define KHO_METADATA_NODE_NAME "kexec-metadata"
>  
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..2edd772bb6d3 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1740,6 +1740,7 @@ static __init int kho_out_fdt_setup(void)
>  
>  static void __init kho_in_kexec_metadata(void)
>  {
> +	DECLARE_KHO_SER_HDR(kho_kexec_metadata, *fhdr);

Please don't do this, use kho_ser_hdr directly.

-- 
Pasha


