Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4B6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mWeLyjvQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iTnSmAfn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sr8kNtZUVcrLtCrf+RT8Hi9gA3/tGSBNUGobytTqIAA=; b=mWeLyjvQwbS+NxZx5SWCtLKpZO
	kvvCfBWOKjqzSP4mnMkXMduut6p0L6r9QG4I857g7WNGPIyM33Bfy0m3f6givMqQ77CE9f3T9uHHv
	8Jsqj84bSn760Ylw7NzctOz3jUzk1mJ6MJYfeip+w2WtxNeSyGFhzpq8w/ghNlIcqc5fexil4WT+a
	y/pjQ44z+hBcDoGxXq4ATw751l0jTlfXx4cbSHSqVxP5WVFGY+CraAGQC+b7MmX51Old3zwYcoSJH
	yDCF7cbWCshAWtPnaQtBwNwury1HRku7NPCcQhNRGL6kGIGrmb1cuthrnFiku7tq1gfbbT3KoGZoH
	ed3i+uBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpFQ-00000006SWp-0feQ;
	Tue, 24 Nov 2026 12:03:44 +0000
Received: from out-211.mta0.migadu.com ([2001:41d0:1004:224b::d3] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpFM-00000006SVn-3haF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:03:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=sq+1U9QBpgUl6gibIVwLvQO1miis3EZ+uRylCpz45Xo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795521817; v=1; x=1796126617;
 b=iTnSmAfnumKGdNUulnW3/y25AQidhfvW67ugwrlq0VvSpNIcO8KR3EWqUhZ811GTMWheopOv
 Fe9iz4OVGlltoQ5z8MbTH9FikWW/uj+DyUdgxN6L1YAx/k9nMVdSWtvslTzwhZhoC7OTQI1vUeM
 ugS+1sfgHJwbgdxvEaQW8DKI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0650ed43b4ec3943;
	Tue, 24 Nov 2026 12:03:37 +0000
X-Mizu-Trace-ID: 0650ed43b4ec3943
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be58ad9600so22965e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 04:03:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEUmRd402cYsJRugyCp6LKWdkaJfz84rvYeAmjoricMCPg0XY6i4EBaK49pDqavMrI/JhcF4vLl1UAMT+gbNWh+@lists.infradead.org
X-Gm-Message-State: APuU4Z82fsacekPQYd95R2RAjxwtAUay5BPbHroEwwYxhGe6kCQ5BJlb
	z3w+7tqnI4r7WSqaqsHnz3SC6WbcxVgLiMUM8WBrYkprFvHqk2udV5UNEAMB07Dv2QXGa2vkDB6
	xY4SfAHXbAnQ+VJrRdfBxxP7DUkRSFOCkkJK/PuEF
X-Received: by 2002:a05:6512:3d1d:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c1c8256cebmr422660e87.5.1795521812773; Tue, 24 Nov 2026
 04:03:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123192457.8700-1-maz@kernel.org> <20261123192457.8700-4-maz@kernel.org>
 <CA+EHjTynhBzhjrFzd514Sycib=1rmh7JqYp0xSPVBvurk6Sm-A@mail.gmail.com> <86a4myzeos.wl-maz@kernel.org>
In-Reply-To: <86a4myzeos.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 24 Nov 2026 12:02:56 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyOzMofQ-7exH65h1G0jCtNy=f9MsW2ORSpLpF4J8xZ5w@mail.gmail.com>
X-Gm-Features: Aa3M54o_qgTofyawRoobP2Y_UigNAYnryN0_2l63uok4neYEvOqeAAfM8d_tF7s
Message-ID: <CA+EHjTyOzMofQ-7exH65h1G0jCtNy=f9MsW2ORSpLpF4J8xZ5w@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Drop open-coded GIC idreg sanitisation
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_040341_394711_B09263FD 
X-CRM114-Status: GOOD (  16.19  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Tue, 24 Nov 2026 10:50:11 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> However, I want to know whether this change is an acceptable behaviour
> or not *from an ABI perspective*. We have several options:
>
> (1) delay all idreg enforcement to the same (late) point
>
> (2) keep things as currently done, meaning that the GIC fields are
>     special and sanitised at a different time
>
> (3) say that idregs can change at any point if you change the
>     configuration of the system, such as creating a GIC
>
> I'd be tempted to go with either (1) or (3). (2) feels like a total
> bodge.

(3) works. The GIC fields can already change when userspace creates
the vGIC. The final ID_AA64MMFR3_EL1 only depends on the order if
userspace sets S1PIE or S1POE without the features they imply, creates
the vGIC, then sets those features.

(1) changes one thing afaict. A VMM that saves the ID registers
between creating the vGIC and the first run, and writes them back once
the VM has run, would get -EBUSY where the vGIC's GIC fields differ
from their reset value. QEMU and crosvm copy the registers as a block,
but I don't know if either ever does that.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

