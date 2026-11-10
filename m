Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E622C606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BOBCDCOi;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=EFS4+Lim
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZFEAJe5RSOFhQbOQqwNvxFPxejburOXhpBzwnwwZqdo=; b=BOBCDCOiAmxFOj
	tmttKLkGPgHnMY8yjWdGgJlz6RpwVFuaWE9LJRBLEnJMGJ78Uzb4EyLAxWNBOwsWMFNeLpX3fksFb
	VO8rDc19uh6n/qgQ1xMo9HWUjtFjI1Tf5Ws7LKap7qMspaskxxOeftghRy/k+JiW7tEpiN+nboYf9
	YdL7up8cIF0xHub9Xz+eyRp1MwBGx/oRbzwjttpqVwa6jQ/y0y1J5S1HLxjjh9Zm33T9fTjf6Wu2F
	P68VUY5AbJ+xNCqkotquQtfXw/HTz6NN21gVdtEbZr5inJ+jufj0qSSc4WqtCN5J1XmxvPb+IvzVK
	Ymx9Mz5Pqm9f+8VTk0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn8V-00000004GTO-3HXw;
	Tue, 10 Nov 2026 14:47:47 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQn8Q-00000004GRN-1VW8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 14:47:43 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-99911ead46dso1047193241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 06:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794322061; x=1794926861; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFEAJe5RSOFhQbOQqwNvxFPxejburOXhpBzwnwwZqdo=;
        b=EFS4+Limf4RjelyVGomHR12Z27tIGdgvKifD4Q9Eb/+SizK8+flT8oZL91BNf/9wnB
         niZKTmF46SgwjhPvsJscWDP9coKqZqp9sswToBLszQtAz1ognX5sXHGZbYJZsZPITtaB
         b7m1EXMhqlZykBqkLJhsx9FQyAhDIfMVRKorv313Ua1cNYbTqNL8aw7NtErjS2y/0ntW
         Rh2zMTEfrmcpg92ES93hGgy8BxzEiosUlGEp6j2ejMrQ2noUyChWdtj5674NihpUWVY7
         SIAtGdtr7p/s3x8z8ARvznWMZ+6oLOyOM5J3Kn3bWDnZACUmU6qxZ6B1RR12w5703TVT
         2RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794322061; x=1794926861;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFEAJe5RSOFhQbOQqwNvxFPxejburOXhpBzwnwwZqdo=;
        b=jygRlf6I39PTjFWh1SDLJnSu4Lbo5sbJJb8dzu+lkE7DMZ+PUKoABHTsHkxMyg760C
         UoF1DYKzZwzjuzX7enkS9mIfjx4X8LHjN1hPEWJqfS5GH/ux8gYS12hhF+NaNTtGj0vi
         Z8MAWFIYcX0BJrwE5Rt8aO4iSp4f68B9JUj0KXLy0ElKl1dV9RO7RaMV9fYDVvYnCtPM
         V8ICUxOkCEHsIlM3tvqHjQYXQYGKzupZ1kyeYOtubYwVGi9b8jRoJVNKry2emsz65yxc
         al3649033+nb7wPIFVYYwjUTBvETBPC5GF821MnqyVYHZe3KWayyjm+XSuoGLM3rq0mb
         EvOA==
X-Forwarded-Encrypted: i=1; AL+hErFqbwUMFve/KKQsLjX0bvMcvDxDLLgWu/+nl97kgqESgZEjBOFHNRZY0wrCr/i1+UCW0RCi0meDqlxkNj/B6fFM@lists.infradead.org
X-Gm-Message-State: APuU4Z9QH2H4WQHNNtFNFZYleVn3lQbxuX/VXISVcLJgnyUn31bVJqyz
	aF469PJULgbb/qIgXbNfujYqlEIm/oxxkYDlJ357GTVEJQD26smwLWYNNtxgh5sFKMo=
X-Gm-Gg: AYBFou1lTaVtQ+qxMw0TGY8EI65+9F8V0qqNGBHytJRCnMWpkL9loJf5cujRkcYiyFc
	kyCBMmLXlpjvk1VDhC8B69U1BSHQQ0fKIJ1pwUU72SoPR6p1q6fEKDIvSA/v9HNT2ZC2ZHISneC
	Xw2avOxVEEziR8DAlfrZv1Vqsn1zgl2g9TbVh4sgnXzLC/LUGjFEkXvamRJEHUtx8SNXE6enLyY
	Ka5cFrSuZ1asz3XDjfp9/AXh7y1K/9idJpF4HgOsmaJwvIs2Wg1KqUU7aHBA3P0KkgQw92WDpgo
	5lb9KtDeTTyT5+S+Ue2HiE9hap/s/6Sx1WW1QpO96FYLdb7bwYfKNNZ+TL39xjEZEAVr8EB6NEj
	FL7PlTXjGsv5RlHLhhcxnRpOqJg9jf9VdsBZVeGj78eaEzfoZSJsg/jDr6Myphj/Bi9El5KNYPT
	pJFs6r3qnm/tHJhdc9dntpLGVb24cR71cyU5TIwfQdMT2xTqILQbquL4ywin6zDaecKuMmZz4SP
	T+lTORbLAFA1jf48q0QFtotRdFwwL9avQmRJGljwMM58MUym06P/p9eIIgoDXCNw5M7fPiP9yix
	0kuEIvlIlhZj+ZxZkaL/6qvF+Hom34BGctSswiUUIJMc44eJea71K05EHTpx40XPHpgAlMvrvxb
	Q/rTXjVBRhfumjGOqyHjOvYZIh9dg2N8g5e/zG5Igiee7tyc=
X-Received: by 2002:a67:e706:0:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d301c2b6b9mr1064638137.18.1794322061210;
        Tue, 10 Nov 2026 06:47:41 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2003b37csm1895903241.6.2026.11.10.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:47:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 04/19] liveupdate: Reference struct luo_file_set_ser
 via serialized pointer
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
In-Reply-To: <20261110050202.529473-5-tarunsahu@google.com>
References: <20261110050202.529473-1-tarunsahu@google.com>
 <20261110050202.529473-5-tarunsahu@google.com>
Date: Tue, 10 Nov 2026 09:47:35 -0500
Message-Id: <179432205559.2329176.7688399969919556416.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=791;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=qYrWWLSjrMyi3btEEyRhgD14ybrNmyQeqN8ETOUOvP4=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8y6LmPCnN2SrnZCSda58BBnTZsMnjk7g+kA/g
 6Wo/AVJiseJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavMuiwAKCRC7dyhM23N6
 3qrED/9liUyRUpQr+Sv1ioZ2pUvLcetyB+2JoLxaB/0UYYNHqDXpwWtEHhSP3eAYwEET2WAzSzb
 cINjQ0UdR20OJBBxpWT+3R6jrxl6smFx5lA1+CtzCdBONdl5NiW3+NITRy2Ip//vGFZKdNjWFk/
 5Y0ii3L7iz6hVXT9R9y6mqGOo2TBCSa84xWnOGrVJ8ijAnCqgOeAMhmqVN+rkl/dWCvzMcCFZZP
 AYRuSxmCQaOa9GxsOttPL5pX10r/UbwioXQZu/aJ6RcG+ql2liIZFv1+3mcSyInleN3SlnUZOVi
 inOQM3Yp2D1a6ekPH7F6Uzb45X4qnnJ8DSfO2LkVSWgmzzpsKuXUePJ8Pe0a7FfO9mUYj5Fp9wg
 IxfJUyigWzzPN0aOcgePZcZBT4fLUlw+zQV3UGnfTiTzevMagmFWU2+B/s0Zt7u6TidXvFQsMFI
 6ZlD5aySuQGLYM3+UdGdp96SY6FEGgvqmSCG63zPbq7Y2WqSBl153diBep17zLt4CJ8n3Fd+YrU
 E2rPF9GR7k6MT1Qc2tSSvCCk+cTjcDt4Fm3op7Z6LrxP3BQDFa0Fh2afBgG5mCHbK8fSxd2uggj
 NuHbXeBNgQpe1vKYQQd97AUSoFlymseer2cfqgpdkxtIZwGdPAYPchrVuPHKx6mZDNkSz6VZZ49
 k5DwAzPXt9kz4Og==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_064742_421572_AD2DE35C 
X-CRM114-Status: UNSURE (   8.64  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 05:01:47 +0000, Tarun Sahu <tarunsahu@google.com> wrote:
> struct luo_session_ser currently embeds struct luo_file_set_ser directly
> by value. Embedding struct luo_file_set_ser couples the session layout's
> size and field offsets to struct luo_file_set_ser, preventing either
> structure from appending fields independently across kexec.
> 
> Convert struct luo_session_ser to hold a DECLARE_KHOSER_PTR pointer to
> struct luo_file_set_ser instead of embedding it by value. Reserve space
> for both structures in each session block-set entry, placing struct
> luo_file_set_ser immediately after struct luo_session_ser, and bump
> LUO_ABI_COMPATIBLE from luo-v5 to luo-v6.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha


