Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597AC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q8KUX50V;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P7SiD7vH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DWMrPh69MIlgCAASSFlOdVPK0cuHXI4P0bcgg/LtNhY=; b=Q8KUX50VS4wueV
	MEIfiZ6L0AnhjaNfqX8PQI3Fk+TMT3sE92We2+hVjwNKWzSxaX6jF/7vrqrUrtttPQopmMPd1E9bx
	Ss3ww2lHvpa5mhOAspJYmmpldOqblT4GSxPKeFv9gcHbE1zGf72OyKzLYw1ZGH4khzVyN+Rh+0OYN
	5StLToblA8r8ynGMXc4sVj6q80k0MRra/7v0nAureL/Vvsxd+uZb0klaiUNMdOZwTA3veAK8y7zDi
	4nbD0PsYCGuOjewydvvrvH59qMfYEdQtv2oFPkOoCESxxYsWz3TlkmDVnH0HO3EjZwxZJsteUsXxm
	5jPjlk7uWbMs9z8cZbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrC7-00000004sHq-03Fl;
	Tue, 10 Nov 2026 19:07:47 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrC4-00000004sGt-1FTT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 19:07:45 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1688504a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337663; x=1794942463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWMrPh69MIlgCAASSFlOdVPK0cuHXI4P0bcgg/LtNhY=;
        b=HAuSACsflUFbnUA643FhjQTOrxgNkkr0HPod7lFWaz4DEpLiGi0SngL0WV/xdtooUb
         XX2fVNVpQrlq8PFVDR79kOEJqEP+DNexdR1SVvLxchVKnbfZ7aUr3SyC51iiH7l5nqdc
         8/UrtymQzen4kugGSevU33cMS/9dEypslNHXeqRrZiSNerAFfajCSFUaydFJcCFWVEJ0
         2fcia1ZFN5lOBs41OZ2TFUXgruf5HpnqnM2DnLRn0Qdx3o1wTmNpXK5S65bHQd4TjjR8
         0GMyhTfqZo8jhquGl7yu195MyUPX7TrNFQqTdXIsgvfVgaZ4XtJcjPFd+rSiEpuEw6My
         9fVQ==
X-Forwarded-Encrypted: i=1; AL+hErFoEAJvX3nteXsOIcdlHLlsYwQ/X7cmtwNzROvZ7VyJR9vxw8sk/inK8tnoULLV5Ips+ekVrdZRPBg2ubPBA4tp@lists.infradead.org
X-Gm-Message-State: APuU4Z/ERx9ZOB+5E5eiV4TUnKFAxFvyRmqe4VSOWe/JW9PnqrVruWmE
	jICG0138BiNPzSCgSQ4Th5DItyA/ZRGjqyW+WdFkOylGNtkXbr7hUZ/jIaTYe9T8VLtT9AFUHU8
	ziABBQ5yTR+cPqQNGN78lzOWcXkzTisA5/7hoD475OnFSboxkU87bku+GMin0fhcwj4JXoXKOPs
	G7XgZ/7qVe/10QUFWikNL2dh9hb1ugYlRlCJfw+zJUng4fRDsghrw1GBhrTjadxPxB/zsw/wBLP
	YfgzZNnXzhVhPtXHXcuLOUUuL2DhEVuEyU=
X-Gm-Gg: AYBFou2k1IJwdOXy6OhvKJ3AkhNT1N+es5253x70C53lSeh8gc5hebdCpl9/lopBEj7
	6PQ2fsAn366xRP4XObXQz7kAPici7UXMJXbpWN3Nehhd4I0mK5MbQ/rcJU4fHcodm7rTURFKTsv
	cdEU1pcmW2+0mpBf3R01BiMXtM+f3li32l98hgGzCO+SZrVIzV4NZZfcgWpsJUiWWSH8lKAStrf
	FwXK+6LF5Wsr8maa1kmsY/a6RZOqBdmYSV5l7o72lrL4CD8R4euh2OlkigBMLFszNSbYwCzCFj0
	LcunjID1sdqiNC58bPt0dBIb4p/OYh3pXoHL5clNWaDXrb1zvth1MpkLBnoGQX6rwYxKEaDq6RY
	fJ44dJM7MX2bO9GOBvO2x9ucA0pc/LxIo/CYp6TxjY/5SFohL13qUiTM1+ZFjFD2QtawnOxGBnO
	43Ki32sMKbPNhoLAafhtprcqoSZ3eoxV2w2m/HSLLv
X-Received: by 2002:a17:90b:528b:b0:3b0:78c8:d56e with SMTP id 98e67ed59e1d1-3b166ca073bmr4064812a91.27.1794337663280;
        Tue, 10 Nov 2026 11:07:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b181c01e80sm70053a91.0.2026.11.10.11.07.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 11:07:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so251477785a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 11:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794337661; x=1794942461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWMrPh69MIlgCAASSFlOdVPK0cuHXI4P0bcgg/LtNhY=;
        b=P7SiD7vH1Pmvhlw7UmU5AdmFcGDxzUdXqwimjyoE8rJ/WPTMb36NzddZzy//nGzsCa
         OY9XVC14Rt7xavoUkPipA5ncNyNH8XrWmnyNeC/iP3jkRpetCtxtb4MCCJ79f5bmE6gk
         LHRjMitEaYWtCmJpibqegAT03wFjKAR4OgQ5E=
X-Forwarded-Encrypted: i=1; AL+hErGJu9ohKXBMR3YJ7ndBSPUqODubLAOKVd3rvIdAYyJK6/ZRvNjI2YtDoINTT3023aINpw9hXvrOuO8Aw3JTOMQS@lists.infradead.org
X-Received: by 2002:a05:620a:1720:b0:93a:824:ac8d with SMTP id af79cd13be357-9479f2c3ebcmr618020685a.27.1794337661422;
        Tue, 10 Nov 2026 11:07:41 -0800 (PST)
X-Received: by 2002:a05:620a:1720:b0:93a:824:ac8d with SMTP id af79cd13be357-9479f2c3ebcmr618013185a.27.1794337660811;
        Tue, 10 Nov 2026 11:07:40 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e76b1c3sm293230785a.16.2026.11.10.11.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:07:39 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/3] ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B
Date: Tue, 10 Nov 2026 11:07:36 -0800
Message-ID: <20261110190736.2346011-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org> <20261105-genexis-xg6846-smp-v7-3-rc1-v5-3-7477b2b4675d@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_110744_345114_308627F2 
X-CRM114-Status: GOOD (  15.09  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu,  5 Nov 2026 14:39:47 +0100, Linus Walleij <linusw@kernel.org> wrote:
> The XG6846B boots through CFE, which parks CPU1 in a holding pen and does
> not provide PSCI. Starting Linux from CFE does not install a PSCI
> implementation either. The working PSCI interface in newer GenXOS
> firmware belongs to a different boot stack.
> 
> Disable the inherited PSCI node on this board so Linux does not issue
> SMCs to an interface that is absent. Set the CPUs' enable-method to
> brcm,bca-smp to select the BCMBCA CFE SMP operations. Describe the CFE
> mailbox only in CPU1's cpu-release-addr property, since CPU0 is already
> running. Keep both CPU nodes enabled and leave the SoC's PSCI defaults
> available to other boards.
> 
> Also remove no-map from the secondary-boot reservation. Its overlap
> with ARM's initial page tables otherwise causes the reservation to be
> rejected, leaving CFE's holding pen unprotected.
> 
> Reviewed-by: William Zhang <william.zhang@broadcom.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/soc/next, thanks!
--
Florian

