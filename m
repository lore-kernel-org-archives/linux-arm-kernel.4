Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04023606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Th35xZHJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=A+JtjkhN;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DJqIhvEt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=62Nm6ymc3kilnKxc/e/Ux6w+wWKZKYa/5s811073n9k=; b=Th35xZHJ/95Z3zIEnHg+bpziEG
	LXjDvI45+i7XioWzO+Yl8juZjN2adgCpOGreCS2TwnRtTEzvD1d1sXDh1ghMD0OHCqmGt8dl0XpEz
	ERZrjqypGnswhe1H+9MsMZNQl1rHfZRddGNKeIa48lOXwfjf6vccYrmVTgN7g7klvVCVtM/iwsyMw
	cvL9zJ8oK8arVp52+al51cUYl/MFz5LQQ1T1AM/uavC8judEPNCSoX/yL6HvaN1ux8jjfOSU6lMmR
	Uu5bM8YZW6mFk4L5Y9fUSOoBstPZCKBRrjScpg8g0ESpE0eJUYMTnqfUANjER7Bk6SAMMl5cg1iW4
	2DGJ9Yug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVteK-00000007Atk-44oZ;
	Tue, 24 Nov 2026 16:45:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVte5-00000007Ai5-0Kkz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=62Nm6ymc3kilnKxc/e/Ux6w+wWKZKYa/5s811073n9k=; b=A+JtjkhNO1eQd8cAHgsXkaSIkA
	ATZ5jr6Mh+EChyfNKuNV95hA6o4Ft6Hjmj6Eek3qRifqUMDIppH5BlnUyuTtaJsS/IgS6xPCtjwQP
	tttyxD6QaTUO2G+7VXdf9kQY/g6TfWtDFiOa3VwvcRnZ3L2VthRHsVnFClmYTeOtAYoYwzhOIgfdk
	JN0Nmk35jf+jnTU/YGxz4ZmHmmRD/PHU34Nfzm8w/SmR/Jkx6CS8lJWIPG+ykFg+qyKUuHFX/uKwG
	3DWofc+AYurCjcpSZ9i8GgsoNC8BpRYGMDbsBZXnoZwdCV3wf91uf1FaLU/CDpjxitG2e53PmzXKX
	97MO+vJw==;
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtdq-00000004MGm-3tNV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 16:45:23 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so33557505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538710; x=1796143510; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=62Nm6ymc3kilnKxc/e/Ux6w+wWKZKYa/5s811073n9k=;
        b=DJqIhvEtioQFg5VhjCL1OXOruEwcWiP3AYwWYVif0AW0PzO0VHo3uEgG3jZyjEj8WK
         va9kszrTgD42wFedJdGOi1Md3weeA+tdsIwgyiHfutw592udQevKb6jRK1Zx4wl/uj2I
         7a64bInVKMbQ/86Pt42dotjNqVSxZZNeB+mKIeolvQSNbyhoP9WPSLFl/dy81W8LzajP
         VohnxQAb0i916jQTaNLKFwtg1F/IvR25CwzXyE32Sr4aMZYBckpea7gtzHdtVRKSWzb9
         a2/vlLRrjDYUkfJnpP5/xqwWkMD1DUNh7Np6ObWCkLZ7aAZAHDQbxnQVXjRb+g7gWyK+
         x6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538710; x=1796143510;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62Nm6ymc3kilnKxc/e/Ux6w+wWKZKYa/5s811073n9k=;
        b=CEIQ6kvDaEE4Pws6LdAH+DAXDO29jGD75Mx7FEE51rDv/EAjY3KzuGm0cVcP4VidOY
         QXz8kbzwBJQh4Rmr4KvMd1fiA51tKGbu+GQwUVJUkhBS789vYReECHbckTtJP5qWF+5N
         OuMSD5JGS8tBC8iByxSdgEbRZFV3daxokTfD9G8oMU+gN+kgB/O/ooyVGmxjimftrdTR
         UGECE7Ar5noM8KrmmcgoSbBiL5Vxs9efwmcr+S5LMcAoh/kqaNf6WKSAY/GUW5T9io5A
         x6CUdwWUlNtkPfASW/7chFj0KUwaLBxa5hQ/p0swBOaOoIXm57fEyMET6JO4n2H2vgLd
         6vug==
X-Gm-Message-State: APuU4Z/x796+VgE9obirOB511wcWE/67/xF9cc32ICMiLhtO4POJHSfM
	d89jPNHn5Xyakiq23izDr5gICuP6f/Ht+sHEatHbtP6fhV18Q1SGhVUlblCLL/sKQ6/4IrX/iGa
	2p81G2pYYk5eywzyswyK3qg==
X-Received: from wmbgz8.prod.google.com ([2002:a05:600c:8888:b0:4a1:989a:a866])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:8402:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4bb88806287mr239626435e9.14.1795538710040;
 Tue, 24 Nov 2026 08:45:10 -0800 (PST)
Date: Tue, 24 Nov 2026 16:44:41 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124164446.2371939-1-vdonnefort@google.com>
Subject: [PATCH v2 0/5] drivers/virt: pkvm: Protected VMs with PAGE_SIZE
 smaller than the hypervisor granule
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_164521_473561_B4F97498 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series allows a protected VM to boot with a hypervisor whose
protection granule is larger than the guest's PAGE_SIZE (e.g. a 4K guest
on a 16K host).

This is best-effort: non-granule-aligned sharing requests are rejected.
In practice this works because only the swiotlb is shared with the host,
which is allocated early and large enough to be aligned with the
granule.

Tested with a 4K protected guest on both upstream and android17-6.18 16K
hosts (with MMIO guard auto-enrollment forced).

Changelog:

v2:
  * Fix commit description nits in PATCH4 and PATCH5. (Fuad)
  * Collect Fuad's tags.
  * Rebase on v7.4-rc4.

v1 (https://lore.kernel.org/all/20261007150255.1648849-1-vdonnefort@google.com/)

Fuad Tabba (1):
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MEM_SHARE

Vincent Donnefort (4):
  drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
  drivers/virt: pkvm: Make pkvm_granule __ro_after_init
  drivers/virt: pkvm: Handle a granule larger than PAGE_SIZE for
    MMIO_GUARD
  drivers/virt: pkvm: Allow granule larger than PAGE_SIZE

 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 102 +++++++++++-------
 1 file changed, 63 insertions(+), 39 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.809.ga0b61035b5-goog


