Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C213606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ouzzN/57;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=OXF0XsPB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WFV4t0eUs0gbqqsFkBQx5rUyLF4Yon8sMLY8mNC/aTw=; b=ouzzN/57giMMyzzCdV39vnY4aJ
	C+alwUaZYe89sb206w67UQ/iDQm5Q01oV9k113Qs6cqKQKv04anQd0yx+Ts9yQ+cfr1xiLBVXpKEc
	3/vy7co8yGbiJhjYK5QOMETxcqYG10wFjmpVDZgnboMWy7cCUp/202vVNuqahHzC+NpynXuodHHcg
	nGnb0NlA3Sv8GDcIzQMjwQrVQv0voB9iq2CmgVPcD756NDcQp/+2rHFX66dbii11FktSx/NLrcQxV
	udro/c4e5bRjfoTvJDaju/LzFzU18ye6P0H0mAfJFTYsOHGi/u1e0WZ2/SE2VPBxU0FuK2ySEFRLN
	BLioVRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSplx-00000001COa-1QC7;
	Mon, 16 Nov 2026 06:00:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSplu-00000001CNv-30AV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:00:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1475214f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 22:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1794808852; x=1795413652; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFV4t0eUs0gbqqsFkBQx5rUyLF4Yon8sMLY8mNC/aTw=;
        b=OXF0XsPB7ster4v4fSpRIIqExFqUXEHYbjDZhCXVUtP22hj0in1TnZM1PcCxXWlxgH
         H7V2/Ys1UFkE/jhyIgUOb/kVAkZef+1rMgoorvShg35JROfMD8CX85IlX3Ooe0ub0mTp
         eIlM2CE6s8L9h4e1H1WnkJEkZduLAm/jtpoZ7cT6OMd8AgODcW0nNkg+UmVsggeBLFJN
         HZGtHqX57FtSdssYfq0yv/SQCpzQF8WQc6C0L874J/J+N9td+5DoL7wngboHiZ9ZrvjW
         LxDqPU6LV2mRnvMalLUK4SaSDLMJCb0twzc34g+yHIwBBQO96tNTVq6Xwti7xQc6O+ot
         2A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808852; x=1795413652;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFV4t0eUs0gbqqsFkBQx5rUyLF4Yon8sMLY8mNC/aTw=;
        b=LK5RAtJ8Znz2/hyoD7nmtmG715dPIlrVa6uvj6Hn+ewaSP6TvLIbYfzR5+atab3uNq
         V5GmgKKM6tCMGVuD5XSVJ96PognZ2B6Bcyq93uQ0utUKKGJrrH0kN6RNSXmpEDRwl3NF
         M7UlekXqb9z0nu9uyS/466ONWhUJopsLZmRPg2c9T2yXbrKBnQaFtqy0ZJhBogNuJMh5
         fbLTaQn5nWw20Y7kzZN3Vdxiqd9Ro3c1O73ZVwmmVPfHYEG5Vwby907Eu+l1l2FreH9Q
         oD9xxe9WJqdgfqAcCSzpilKqXI0rj0yInCReKrBodEWmEm1TITL++0qwoV4Rk7M2RPfS
         OGhA==
X-Forwarded-Encrypted: i=1; AL+hErE7IONJAtf/hOoqeje6cyzOUnOyyFa6MMkJMDMqst26x7ylcIaBrQncbZRVyd+5rb2uAQN6xaYqdt+dAU+RSTbX@lists.infradead.org
X-Gm-Message-State: APuU4Z/gK9YliocI+OKWkWK8RSP0DJgNs7+W/oUP5Vv9Eh/0fONUELLf
	iiKul5ltAQboMDX4M7MlL/pGfTnUKKWffh5kcg0ZYI1GJrbP6O/NUeMkC9+/4mmA+xg=
X-Gm-Gg: AYBFou368ncIEIv8+88yYr4ML34IUct4qJmcVuuq0akiWxa7VsgKX8d9Ro3PnyzxlLN
	0Si1piNr3jhOJ+3F36laAjwkhX2G+A3U43vovSIE73XCfk79VjXiIz0SMIpY0Y827jReCW15bJ9
	XPVHO5d9gf8UkHo+RSo4KhfTRpSEg6XmsXuEgvxjv/k0plHBtjMqXcOOtCnnsNweB4zVxuK7/yW
	WBTvXC6/vzjm1dUv53DuLEtQXdjD2VoBJWeKZoYvMVL/lnHTEorL/pQidjDXhlBOzG0J9Yn0Gg+
	AYbca8WmcyoSKRUENoxuP2cIjCeKoEncaTIVgPvU4x5QrsJrL56WGvQonaSHjeqy9VBhVMRPlwQ
	HoXN3AH3gIcEMoK+Fxkmg2pMJRcWctkFNHI3gjYvacedkPrXVlcYRMKSLTHveUSTtHaLUknswVc
	6NASKDaba3u7Nz1cgn+FPQEISqJyY7DB0akuFSM6eXxvdZG45gMsM8GomIHXsJi4YivQT2pQNSF
	M1X//Ej1R2FebsEAOHfaLSCKWCTTp781yIuXVr0HD73KsTKtnCJ0R1AKwIi7KNb6X5lckpmQL4T
	NPp8x9BtjNi+MMGwJdo=
X-Received: by 2002:a5d:5e85:0:b0:48d:f391:5c45 with SMTP id ffacd0b85a97d-49c740bcf7amr18562595f8f.42.1794808852035;
        Sun, 15 Nov 2026 22:00:52 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb7dsm20283638f8f.33.2026.11.15.22.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:00:51 -0800 (PST)
Date: Mon, 16 Nov 2026 09:00:48 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Jintack Lim <jintack.lim@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH 0/2] KVM: arm64: nv: fix a couple bugs in AT emulation
Message-ID: <cover.1794808373.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_220054_770882_C13FD0E1 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These are two bugs in __kvm_at_s1e01_fast() which affect nested
virtualization on arm64.

They were found as part of our Formal Analysis work at Pereq.

I have tried my best to get things right and I have tested the results
but please understand that I am a newbie in this area and review
accordingly.

Dan Carpenter (2):
  KVM: arm64: nv: Fix AT emulation for TCR2_EL1
  KVM: arm64: nv: Update the shadow MMU's VMID for AT emulation

 arch/arm64/kvm/at.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.53.0


