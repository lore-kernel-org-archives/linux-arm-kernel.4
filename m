Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321B606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2FAamYI;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=ax3EThsO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fL7U3381lRKl0leRXdHMgrHniLI1nUrxbkYQxcEjLqc=; b=a2FAamYIUdKNMi
	SqdyYytiM6IhmB5R3dmxkt5sNK19+vhOgcSMATRh+ZtADdJD8AjcLL/pv1n621q7n0gzPHHPjJdkg
	rYiR2F1/lIQ/fFUmz0WgCi6CyiO2lFwmi648EJu1yWLzfNJSIkq80RIhHlQNOtBjcRfj36LWMr272
	CnEcJGcwp129uJvokmBwwK8B6330iDVZgriurY2j2WFgkFnW1j5uCmM/w+cWOjkzrTpvjBuXehZpU
	sGmkVX+WwvQ8KBBgN20HFSLIBBli1ZdWwrLysnt71Z2Z+ANEk0JN1hzNhS255d8ENsLyyiVAQblUV
	r0SlkyCaKxPD4nbeQUzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGPc-00000001ro7-3Eh1;
	Sun, 22 Nov 2026 22:51:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOV-00000001rLs-171X;
	Sun, 22 Nov 2026 22:50:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=fL7U3381lRKl0leRXdHMgrHniLI1nUrxbkYQxcEjLqc=; b=ax3EThsOorRJywhBtMvHtFKJ38
	IswFG3psBt0fWq4p2CSsOGvDySCx+Z21iAS68wk6V+HfzXVUO3bRDkhzvClaRHsog4XLmyqjZXHfQ
	+in6YffJYuWjoEAUwwBnGyodjmtEVVD5EB05DlAp/H5qaEwSM6x+qAjoTMVfW5q3zQzER0lace1CH
	aEgBBXX06ABme8yHcX+/4UnFNMrddTAKO8TZSCKlKP1yqphzvmN8sEw8BJByvEonmc0fLqSoMA0G8
	9I+nLlbYNwiwh/i4ApYcd/CmbNI1bI9/b2kXznfEEUWLq3T2OEnQRdJIMpRabzRFbKwm+bX7xNm91
	hvT4NUmg==;
From: Heiko Stuebner <heiko@sntech.de>
To: ulfh@kernel.org,
	Leonard Lausen <leonard@lausen.nl>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	detlev.casanova@collabora.com,
	finley.xiao@rock-chips.com,
	zhangqing@rock-chips.com,
	inindev@gmail.com,
	linux-pm@vger.kernel.org,
	gahing@gahingwoo.com
Subject: Re: (subset) [PATCH 0/2] Fix Panfrost boot hang on NanoPi M5
Date: Sun, 22 Nov 2026 23:50:26 +0100
Message-ID: <179538782480.3150822.6529696700670964484.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019092417.391522-1-leonard@lausen.nl>
References: <20261019092417.391522-1-leonard@lausen.nl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145049_678862_FF4290D0 
X-CRM114-Status: UNSURE (   8.00  )
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


On Mon, 19 Oct 2026 09:24:14 +0000, Leonard Lausen wrote:
> On the NanoPi M5, boot hangs during Panfrost initialization. Before this
> fix, booting required blacklisting Panfrost on the kernel command line.
> Loading Panfrost after boot reports a GPU power-domain acknowledgment
> timeout.
> 
> Enable regulator management for the RK3576 GPU power domain and connect
> its supply to the NanoPi M5 GPU rail.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: rockchip: Fix GPU domain supply on NanoPi M5
      commit: ac5f8e47fcb2e7a5e5829968a406d2fbff63db8b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

