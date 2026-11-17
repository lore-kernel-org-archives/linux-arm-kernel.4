Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690C4606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZnefRhB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OC3FGdQa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=; b=aZnefRhBEeyfRHnhVMF1WvzcTv
	2xB631iVr63SOTMSi3SXatM4c/rN00n2bPA2OqVvtV9oHFBQ52/QBxX/C75FtdMYmIZCbslOfoPcg
	OPlDu5bg5Fc7lAdWbBjGH+khj38HFR3uqTGUBWK0mjjtzhi5pNEkRDq5+jETgdi1evJC7ZihsJYhs
	RWQtMI8YRBYSTPt5XpBZu6U4LbjJW1yCCJmkTBbZ78o2hEdo1RahMTPZr2BU+XokM1YFHAavLrPGR
	vDDzb/nKlxWtimR1LpNPBUDs2QBbbI8T6k9uICRcnCf3FJmowZ7xID6133/GvqQeOGfXUpcR/hFiH
	ic9EAVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKEO-0000000691Q-1y6A;
	Tue, 17 Nov 2026 14:32:20 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKEJ-0000000690r-3vVW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:32:18 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso7443e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925933; cv=none;
        d=google.com; s=arc-20260327;
        b=gWGnwWbDIDc4Hq5KMRUUL9pTIp+oCDIPyuO/fhfdcwCxAKKufOqBl9/wZgWCz6+T3w
         4afUvqfntZLtgJHjo9UJ/gi+iAlpfSYiwwkf4bkt6+tjIzMUZwdklJQMFPtKKX0t1jmP
         nUbSMDjexDyGGgeUkbcqbvBiSJy9hQdeV1wbeIisAZpy73XAwRVp93ztvGBnRy4haCw5
         J2j1X2zC8dyRcUv7IPJxh5Wy6Bfdu/0GYj79xgu2+FyPmRxKz6xkr/IX3FZ/BbZSrut3
         B0rwKrOIVzf5Z/HpMI7sUT1vRAnxw91YYsDYtVyB9qGu5+BCt7G4mxZ/8M1xOk041C2f
         Em/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        fh=ZycDyp462ZiNnQa8b3/pVvuwORsHTzeqzflXa2PZzpo=;
        b=S6cz56y2ISXzaNhobJZFX+n6pei6bH/SQe7QbDduI4GVSlI33T51nk+WyA4Io9RYbt
         62veirPNbvNCbhFCLQ+xpr5BniU4+mkQmockIlJBtKpK3EUCMD8FbKrKmLwuXzETqz1+
         oF6MtF7arQzt6DNtBoa4iVN2AFliNYj69SUnRruXfG7sNesMm9DQPwTK4hqWIuWTNTvt
         QK0xidF6e4MI4jS9UYKdAasGaYyGFdbORPUuFPAhUEqorGWm2z4MIA+Z/nJekkeMt9Ub
         bR3TRsDIbrTfZ2jmbNMOUuTAnn67/qqDKNxyxwBLUgF4Dhz8UhyWqmQpCMbcda3DnBRL
         1btg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925933; x=1795530733; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        b=OC3FGdQaWOxetOcTJFnpLCfEEuh0bFLzmwyB+zmj38CQ44YVIEE8QgwHehcfYBEE/s
         8ftPxVGToG3phhBo4W4MHoKGS9jAq8zSq6k2NLTaURgRShqLrgO2opVoIAwjEVcEJXZC
         57332n5rCVZqaLgwirTVYfXXfcvfMA6TasviVXuHQcP9TXA6znhP0xCcqw/+yaR4rYhS
         goVPg5iZJutRUSI+gJq5hTNOBb095Bn9d8ZBMbRjDSQUXFifbfYWuIfiAtyarKXIuvu/
         5cDBPm2sXAzXaxNF+puC07Sil4z4WoVrWqmJVU40EwDToZT6eNizmIMF8b8+vHRfXoan
         9RjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925933; x=1795530733;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        b=QYVJcT4j9iLzdYaqtq7bONtslGf2d6XE/mm4aleNttx372nlu81y7UsOT7G8LIxUq1
         45gW+wBKCeQ3RVuzm06lfGaSyxgNbW4iRLOQUG0w/JpS9Tve6rYZWT1iU1ovq4JLhFr3
         l4tnVArcqETVknvvBruwY3rDeEnjZPhCYCbYTN+jpAV/T1BEidBbfCDLnQDus72oXokY
         bPOCEiUeS+hnOq/MPH2fz0PsRR+XCtChohrrXdCpn/Yvim6UP7KXjQopl0A7sGK/rByV
         ouX76m/7EXF1/QZ5XvjNKpD4Q0Sl73yS07q4zIo8J/Q1ECQQyj86a5wVgg1UHCM+hUh9
         ng0g==
X-Forwarded-Encrypted: i=1; AL+hErHAOkIV4qKyesd7ZbyAtsvKvLR7F9qlorahzUy0vzpxZqKtYB8hzscoNv4/PIzLcsDTKwOOeOw4zl+YCzD5O2/B@lists.infradead.org
X-Gm-Message-State: APuU4Z920DtrQAxKR1PHB2MY42mYp07yVnemKuAqZUV5TZqxJ3u1fMCB
	dMntV/0/INU/9hY+FQmdcIQ8FO0lkT3BjzqhBVLFgvFeFFteXjrx0zlDqun/gKZRwcd+U0LoH3L
	PHO5rOqgDZ+TJZc0GtwK9oopm4aq2GbbVmlMhoCy/
X-Gm-Gg: AYBFou2UAHKglq/7F6LKSFgYM9Oh1WqghJpp9Qaf2I0q5PRSWKveZnzyo+L24kWENBI
	hrshibUatjjtNv/7sxNfqTl7aUPhDuU3K6jW5vCrs1W1e1qtUUw0+37FP2Aty767f8Mi3BcPK4U
	UEaLCNuLf9kT44MlIN1qOr2h0HVC9T7DgKB8Dokkc9GurMWr66HLRCSwt6qwkYm/1pzwKwn861r
	pZlNfR6A0NsasUR7EKo8hp/SUgM9TvBllYfBUk8iVsT70psBM49E7J72lCVvk7ppIUmd9KvmfyC
	b3KW9sbssQHr+RccROzPBFC8Of5JJOocWtL3Pf/8S1e4REpbtHsXWYvenCimpHd++QoRGIPasaD
	KdCiXPtQXAUipEbEvh3t+Al8ht30w2n6/YooftrNPDaE1iTvY9TWVyWyt+xWw0wFHub2Rz2xJvZ
	ncFfzNpD2Krj04hmNtEsGKZII=
X-Received: by 2002:a05:6512:1111:b0:5c1:4f9f:1ae6 with SMTP id
 2adb3069b0e04-5c1a217f086mr135560e87.15.1794925932245; Tue, 17 Nov 2026
 06:32:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-8-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-8-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:31:35 +0000
X-Gm-Features: AclHuK8jwarv0Qdp1aWUBJu9cvVLVN2wG1yO28RoPz1SpZjEhJ3_zh_LKO1lzYo
Message-ID: <CA+EHjTwqYUBvhjF8dxqVA1mF_Qe1r2UZdwkZ+Zirgmm2um=skg@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] KVM: Allow architectures to reject memslot
 changes before invalidation
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
X-CRM114-CacheID: sfid-20261117_063216_005647_9AD58379 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Suzuki,

On Mon, 16 Nov 2026 16:43:53 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> Architectures may need to reject deletion of a memory slot without
> changing the guest's memory mappings. Currently, KVM invalidates the slot
> and calls kvm_arch_flush_shadow_memslot() before
> kvm_arch_prepare_memory_region() can reject the request. On arm64, this
> unmaps the slot from stage-2. Restoring the old memslot on failure does not
> restore those mappings, so even a rejected deletion has side effects.
[...]
> Move arm64's protected VM checks into the new hook so that unsupported
> deletions and moves are rejected before stage-2 unmapping. Keep resource
> preparation after invalidation, since invalidation drops slots_arch_lock
> and allows concurrent updates to architecture-specific memslot metadata.

For pVMs the invalidation doesn't touch stage-2
(protected_pkvm_vm_s2_ops uses no_stage2_unmap_range()), so the reason
for the hook is the Realm case in the next patch. Can you change the
message to say that?

Cheers,
/fuad

