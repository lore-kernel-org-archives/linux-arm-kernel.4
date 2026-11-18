Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177460A2613
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shoclq+j;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=JKOPVzxz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tpQ8VO3UkpPGl2BMdFGh9UILzHHG8WU7QyZ3fXKetUA=; b=shoclq+jGTEDP1oNXrnW4xSvsa
	axc9OycZ/kc1XTHhzDhqZl1RpmZ70FhLxm5v4HNZNIDvXU1G5SqglkSkjm+Q4k5JVI9j+2J70tVv0
	WCv4ra9GyERNexUth+7If1l5zDxiRntKZ6jaHwMVhhysh9cmbA8BAjTCh+1iHU2ZVJ8yq1tEVG2Nr
	h+SHVxmTJ7PRrUE0jAym0g+En9gyAX3DsTOAxFtwpC+1ow1gP0avjAujXkQgWPVc0F5UD2bidDyDY
	8cGZJZFPfN6jdf+GZ+rU/MkAaGpdwo29a8naWVi/tLYexaOChb0N0/+FKaW5cPo7gqkjGxjwYmbmD
	t7BvF9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfMD-00000008uUP-20Va;
	Wed, 18 Nov 2026 13:05:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfM9-00000008uU3-314S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:05:48 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so5209085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795007143; x=1795611943; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpQ8VO3UkpPGl2BMdFGh9UILzHHG8WU7QyZ3fXKetUA=;
        b=JKOPVzxzFxlQO9YMtl40Ul2/TnK8kbuERxRaJTHK7Cw8nlsJLxiDRCKERaD8ofDBOP
         3cJqfP8shxI1dIbty+3UCSB4GFm97CUtawdtI9eG1zC3i/WAFX4rtxAEMDVOycAIyh5H
         J7BJu9Gr1Zgig4nNGpdj2/il55sgcKTpY9PzzujP2aMlBB7LiKEevtwAsAkwAzb8wqwT
         nAG25R3c+MZalPdCX5wW5r1fRbzEYoKrBWTi8fcm4SI3MO56QzCNqnBuaZwapRnbn2ZW
         D/fYLRybuw3jjXT2zBoMJ9i5mTsnhTf+w7COy/n1EEL51YMd3CpIdIKLUW2YKLP7JHMk
         VXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007143; x=1795611943;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpQ8VO3UkpPGl2BMdFGh9UILzHHG8WU7QyZ3fXKetUA=;
        b=DGj5RCAGpvBimbj1vWoX3NxcR3KWwPgrW5l8kckVLXM49ezm4it6WZqEkt+sy0Sjz0
         ScQtdsi7k+DLfvs0rF3VKU0QrvO6iugc8q/LhnaAeoTXmNWTHKZF2Szk4eT8dHkqj3x5
         YQxT+ivbaxWPT0SC8is28U59YULEjqdzn+2xlxKBeyo9sUW44IQ28Yu0gVSWP9whB495
         sV2pg8s5U+arKsjbKrX6vfcbZImy8Ju7VjHi6E1oFxW+DfU34hYLWveKanduyjYkECPR
         CiO7ELqO67UfV0bO9LwKkng6TLLLdec00dJ5apwkU+Xh8LnQkVo79DK1JZgNIqkmmB5a
         DOAw==
X-Forwarded-Encrypted: i=1; AL+hErEmjPsbqWw4bakOOct6xvzmKGDsurNs18FcNAPTYaxmXSdex4MjlC9dxvxT64MJcb5hfZOdMButXq9UoknMG93A@lists.infradead.org
X-Gm-Message-State: APuU4Z+rsKdb8hRNcxeTRCfY4rZ7p5Opt8VtRwnVD1pmYdkzY8E+rB3V
	2+HAaiqTAjAmtKoRvgeET9UM6u6BZciVJ6R99aqygaZTw/Jmwl7OObZBVKuo4aXQjYU=
X-Gm-Gg: AYBFou2lAQrRs2DVpaQCKMkxEpwtZW3V8F/VZOdhAuyEqUBfC2jRut0zn8l6U0jOQvk
	5n53d3D7Rn9Pf1Pu/mzNiHlyc8DIrJ8/Tgy0tD1H//8kZxlpQcBxuMqhqH+5DZf9rK3KWZkgFYh
	91/CtPpJwR/Mc1CQELsiqkDiD+z1CiXWbWRae3j9ciCA6ZOgtF/ATOiot8IA/rCeTgFu9D3P3qU
	QTgsb+iHBbOHaVQLmiUp3klo5NSF4KFYiCJLsRNVzkcLMcYG67CpSoppOlEmxA7eDCCZyAla+iV
	pDi9MBhukT1CXXMxx3EZVFtqf3pK+sYIvSIYY0Tv+68D9Xh6XazZ3WEpt2tOYospYXpjBAdk4WL
	4SZd/Q7tYS40C4ESzYJGEQ+F0a7y9/lgqEKqcnjF0VeGbgcZB5rbEkRr29JIJy2d7x3MW9CDBYh
	QkfjKFS6KJ6NXMBIRzWp86vpOv08QNVel863Q+o+RvmFtKcuG9hOmV9ptq6m89DY0w8AD/p5vtI
	ff3zbrIEMFeIr1CjEhTJ/nSqMyV2Pb93KIFK1ap9hbMlMTsiYXoAGg6dLwyARnw6EpqKWSn1HIA
	Kt2ujJxFiShCwrQl00s=
X-Received: by 2002:a05:600c:c16d:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4bb7da3aee1mr46453045e9.24.1795007142605;
        Wed, 18 Nov 2026 05:05:42 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57664esm27848905e9.1.2026.11.18.05.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:05:42 -0800 (PST)
Date: Wed, 18 Nov 2026 16:05:38 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Congkai Tan <congkai@amazon.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Haris Okanovic <harisokn@amazon.com>,
	Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Stanislav Spassov <stanspas@amazon.de>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH v2 0/2] KVM: arm64: nv: Fix a couple NULL dereferences in
 kvm_inject_nested()
Message-ID: <cover.1795006659.git.dan@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_050546_806787_1DB85DF8 
X-CRM114-Status: GOOD (  10.87  )
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

This is part of our formal verification work at Pereq.  It's a couple
of NULL dereference bugs that affect nested virt.

The first version added checks for if the vcpu was loaded but the
new version loads it unconditionally instead.  Also add a fix for
the related bug that Sashiko found.

Dan Carpenter (2):
  KVM: arm64: Load the vcpu in KVM_SET_VCPU_EVENTS
  KVM: arm64: nv: Fix NULL dereference in kvm_pmu_nested_transition()

 arch/arm64/kvm/arm.c      | 8 ++++++--
 arch/arm64/kvm/pmu-emul.c | 3 +++
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.53.0


