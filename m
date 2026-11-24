Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377CF606A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/yUK1Ju;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.a=rsa-sha256 header.s=fj2 header.b=aSKoWw8t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mCdvX3DKxNd4ufd5SveU6bheHpcm5WlWjpwmAB6yI/I=; b=H/yUK1JuMd9inZHxCo5WI34RE/
	NGZWnzGg0vd0USBeiJ5mqyAL1+ltWZoC6n7ds3bNP+n+p/pmYq+XzVwyu8nfCWvL1BCmNIBOEBhYp
	YyADsHnaO95LjuBy77KSyqXJBOqI2D9eqj09LYiw3yMs9lCQvaq4GPgQpM9N8CAHzse0wRCPywJQf
	CfY0qBscQQLPyivVdiByIt/qLaXUkkdhCNszGPS2mjrLq79uny7lqenQGG8EnR554ihfN1hgDnELG
	A6XHftJ7uH6Wdz6Mb4okiWtavFDAofIUL9WADzuBivbtN5GlcOkpjhcQ/REXf44uDAzpVorkv9pyo
	Un9LnqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn7k-000000066tC-21Gx;
	Tue, 24 Nov 2026 09:47:40 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn7g-000000066rj-2dmA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1795513656; x=1827049656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M5NqBozgTmQWYS9D9HJSCp5Du4EFXSk47fr9zjJkO3M=;
  b=aSKoWw8tFtcOUjgFATEWg0uTMeRTNVlOEdj5IS/5P8ue5Ioj/rrW6vz8
   1jnO2fn3gn2lL9LIloxMjD4g423xiCZrWSQSUJ/VSbJzpKKhR9V0xid2e
   bbKnF+Vfm0r6FZr6gBBlkrueF0irLQoR1SBdjrxKxkebCTP+L5D00Uf6d
   WYVh9XOaiSVNMmBE5+6+tpq/KVSylg7CI2tLWNt2MeS7ndeWHDu/LgaPc
   I0mo5wwoxu66avW/7c5qp31rRJu+pDXiPeFN9SFkD/8pwajcnAwygmrjD
   CXVVreHvLUuEZed4eSjAGjk1kgVhBEsfZ6xQBvhkaZU7dUCe/8F/SlYeY
   A==;
X-CSE-ConnectionGUID: 6Nw2GGmGRUC3U00QqM6tTA==
X-CSE-MsgGUID: ZPvetO3kRC6oN/j7cCm3YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="262902702"
X-IronPort-AV: E=Sophos;i="6.27,230,1786978800"; 
   d="scan'208";a="262902702"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 18:47:33 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3B6FC1C01429
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:47:33 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E6B161C00958
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:47:32 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.1.165])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id C668B1800528;
	Tue, 24 Nov 2026 09:47:23 +0000 (UTC)
Date: Tue, 24 Nov 2026 18:47:22 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v4 00/11] KVM: arm64: CCA: Prepare Realm memory management
Message-ID: <awVZ0UrEKN9gLHIZ@FCCLS0092175.localdomain>
References: <20261123104233.95710-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123104233.95710-1-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_014737_084388_5F6E2BF6 
X-CRM114-Status: GOOD (  14.28  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23 10:42, Steven Price wrote:
> This series adds the memory management plumbing for CCA, building on the
> basic RMM support [1]. Thanks to everyone who reviewed and tested the
> earlier versions.
> 
> The patches introduce internal Realm VM state, prepare Realm stage-2
> setup and teardown, and provide RTT mapping and invalidation helpers.
> Realm memslots are restricted to the lower half of the IPA space because
> the protected and shared halves alias each other. The final patch
> connects the helpers to KVM's stage-2 MMU operations.
> 
> This is the memory management portion of the larger Realm host series.
> Realm descriptor creation, REC entry and exit, activation, and the new
> uAPI follow in the integration stack. This series alone does not enable
> Realm creation.
> 
> The integration branch [2] includes Realm creation, REC entry and exit,
> and the remaining host support on top of this series. The MM branch [3]
> contains just this series.

Hi Steve,

I tested the v4 integration branch in the same way as described in the
following thread, and I haven't seen any issues so far:
  https://lore.kernel.org/all/avV-P2_fOkFWQVnM@FCCLS0092175.localdomain/

For the series:
Tested-by: Kohei Enju <enju.kohei@fujitsu.com>

Thanks,
Kohei

