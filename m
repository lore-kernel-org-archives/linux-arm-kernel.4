Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE27606D807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PuVzuoTY;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Seht+aPC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WZoDzXkOMT/5cXIMxLO4BLJijoO3XJv8ed+jm9PnUm4=; b=PuVzuoTYedgB4i
	wboPr+psaXf8xymIDo8IlBTVTxvMy4QDkwzI+5ZwYTnnQfDZdg7oYSO6WXmDcEjCIj/Q+/oLBemiq
	cxjjvMYvhwPqKY/0DR/qH3WHTxzyDGiWlxAENBmaqcL+P5AskBcgmLPONm89EWhmwpanqGyvYi4z1
	vL6poFDKX9v09369ipkm9gucw5m87NqIOn61DAPClM4hlCzxRbT+PZvpVdYToyx2DoI4fPc68xxHc
	n1+o9wTE3w+1/XFky+nJnYruEw6Jzrnpptop9Pnx3cyP6TgQLwPWJKkMGqFoJZfSt/MlqRdGKkv0X
	eO5XhjTupBRDzGUaEGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKsr-000000005rK-3GNl;
	Mon, 09 Nov 2026 08:37:45 +0000
Received: from out-224.mta0.migadu.com ([2001:41d0:1004:224b::e0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQKso-000000005qD-2n8X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 08:37:44 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WZoDzXkOMT/5cXIMxLO4BLJijoO3XJv8ed+jm9PnUm4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213460; v=1; x=1794818260;
 b=Seht+aPCpyOK5KXSCO4hctGHBc83Pf1IX6evZliw9wXT2hzR29V45R45VqIyXZvoU9lnx3m9
 FGpE/7CY3NjQY4gNCEjPSt0PIHJjneKfmoxjLnu05U7oPF1VvdOkcgPppVOik3UhpchyIH+Qi8J
 a6fIR97+YZu/Rwi7PALL1ITE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d92dc173b9474008;
	Mon, 09 Nov 2026 08:37:40 +0000
X-Mizu-Trace-ID: d92dc173b9474008
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Add support for self-hosted debug in protected guests
Date: Mon,  9 Nov 2026 08:37:39 +0000
Message-ID: <20261109083739.819288-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102093950.2922035-1-fuad.tabba@linux.dev>
References: <20261102093950.2922035-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_003742_859186_B5CEF549 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

I've folded this into the series that advertises the rest of the
protected VM features [1], so please consider this posting superseded.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261109083205.806619-1-fuad.tabba@linux.dev/

