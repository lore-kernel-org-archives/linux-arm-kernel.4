Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C13C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xq3Z9bB9;
	dkim=pass (2048-bit key, unprotected) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=VhuxzhJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ivc+yZF1e+YkHBH2XdPHCIshByex18b++1Ftez3VniI=; b=xq3Z9bB94+xackCsIY+s6C3Wf5
	kKZOGowhJBvGkF38eKN6h3SXBfnm49URanlP2WgEZUo/wM2/9HLUwEiNnVB05h7VXxod/AlF5aTFl
	8j7TCyemQ35zOgiDhTBoDLQGBlohTFKNMz1a75DeCfI4DLRhKt2tdhfSczUlfbLy+C01OpUGMHbYZ
	j0O6+BfATG69zGpsL01z2hEKK62Scvo8xoRj5nmaDhl5QQ2uNBZYEp9Yc1NJaD9GLvNHj0NgGrrIq
	MUcMicz/BcGv76i55KqUjPP6ZsaoSHQG3+ZywEawKztdqrGa5XoWfge6KPSKVinjaSR0uAcUzyqNY
	1txwpnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZfY-00000004elQ-2wlq;
	Mon, 23 Nov 2026 19:25:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZfA-00000004edJ-20g5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:25:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b467581b98so35238365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795461913; x=1796066713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ivc+yZF1e+YkHBH2XdPHCIshByex18b++1Ftez3VniI=;
        b=VhuxzhJur764swy+9NHYClvmE8w2ylNQC9YBMJo731t4/2PHayi2QFznTVPDl2Wdyh
         ibbZa4EP3fm46HavFbW86Ew9ElHaOfKYeigU9diQLXVVJ0XkznmHTPMM29iDs3VknDsT
         zZri+StoJ0+/QUom6SPD02yI3vNbsxGc5gLfFJAmyAg8gH2jtqTWomKs0i+F05kcZtDX
         8sR2fGKtYm9Z+HpJGzEl/kdad1f91Yj7slASIGehtKn9nldJt8W+g9bG7RpSOUXlLW6N
         idu8JdkacPKTvyJSZXKk9s2XQXI9zMoNAujSnqLmRoJVR0slFZWEz231+mGYW5462Qdc
         eO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461913; x=1796066713;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ivc+yZF1e+YkHBH2XdPHCIshByex18b++1Ftez3VniI=;
        b=StQotLdSsWRqYAhqUS+E0QxCVMICMFAXPagqMwd81mUTr2GHwOtxE/FTiS1PBDtnMk
         xBgBfSTnTfqAI7g4ZnbMu4kVez/8mmse+xE1XBeZBfY+9DB5NYCbQcNNYf14ROGKc3d3
         oOLCu2zArDsuTEYDh7v/2dAedOdZ8OcXOCKHrIg1TEtlE1O+plwerCS7M/RnwJee/30A
         j6Z76cSI8nrqowRtpyt+c7omHIEl9lD3KI2YSYubiNHQI9MzFo2SitY2cjT8t/ajo5W+
         2yllIzrGMHkOpG40coRi4fIz8/wFlzF+j4o2XUBpA373yxp7/dVSmRv7hiMmSG+ftUTR
         jbCg==
X-Forwarded-Encrypted: i=1; AL+hErEfxxw9yhA/SHYmxKn5sxX4tj51GujfaIriHfHIUJJLOBSitTBqYSoshh7dvPqhVMLMW6IDeI3TSyzEFZcBMBmw@lists.infradead.org
X-Gm-Message-State: APuU4Z+WpcreYkVKBmaxZpADFLUYsM3LAA91B+KcIs/8RQe2ZQznZLYs
	Gb1jcbLpcFxJAhmE6ETLCwOMbA0yBGkq9W+LAD+TDiS55ePmJnFYZxHJyY2Gu+oZBgkSlKWW294
	7KtF2WkDoSg==
X-Gm-Gg: AZFdTZf4O1DHqUEHQ9dgh/qHHUOUWmMc+AIEDMdc2bDLprq0Kd39z53mCZ9Y6geOOE7
	NYBpFcDWnIq3I4d679mGD9Vt0m28SMclvRIsWzefUt20M3b14G+oPntwjboUcqnBAfv4CkL9Epd
	uuNL83s1d/kMLA9RyVxjVqguKUX8RRpZEU4K99nnLf5ztqkE1VOcnnwnbREcwDC+KN8Jf0Ts5Tj
	f7IeTfJm6Hi0uzLV1PalBkQSd19nKT79hxcw0dgxEPmAC/tBzxv9y51TZnbdyG9javKFSSqjG5S
	cef0/9QqGoJptOBGhpMEkskhD38PONX5e3d+R8s3E55l/jFsqc56Qrg2c+848KJKU4lkVah7JVN
	4dr1niGKTzQ/ohKbvtIdxX2G2joNYDlKasvQVXlhNiMNgfnUV4HerGHc2smYXUyj5SUdaRjAbp2
	d78Z9Vsrc6OUJn3BJnhS3hWzpGZpDD6nOrORDpCpugTiH8oEBQ006838tfHS8L1Ua+7+QYMJyT7
	/KZuivE/ag/hy8uOJLLAijI9raw9bL7C1cj3kyU+HS+Hc43VeHHkiNBtMRhvKX626FiPk5Sbt+B
	rM0RLarpagiYnax3rpY=
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr240330235e9.12.1795461912931;
        Mon, 23 Nov 2026 11:25:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm442986305e9.6.2026.11.23.11.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:25:12 -0800 (PST)
Date: Mon, 23 Nov 2026 22:25:09 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Upgrade sub-page TTL hint to maximum size
Message-ID: <awSTFVxQQuz1tbk4@stanley.mountain>
References: <20261123182312.4842-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123182312.4842-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_112516_818194_EEECB2A8 
X-CRM114-Status: GOOD (  20.32  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 06:23:12PM +0000, Marc Zyngier wrote:
> Should a guest be slightly foolish and submit a S2 TLBI with a TTL hint
> that describe a base granule size smaller than the host's page size,
> we take the resulting size at face value and feed it to the S2 unmapping
> code. Which legitimately screams about something not being page-aligned.
> 
> The architecture allows us to drop the TLBI on the floor, as we don't
> support a S2 granule size smaller than the host's page size. But it turns
> out that doing so is proving pretty hard (we call compute_tlb_inval_range
> from a number of places, none of which is amenable to an early out).
> 
> Instead, detect the annoying case, and pretend that we don't have a TTL
> hint at all, leaving the size upgrade mechanism to take place and use
> the largest possible size for the guest's S2 granule size.
> 
> This will still allow nonsensical stuff to get through, such as a 4kB
> level 2 (aka 2MB) from a guest with a 64kB S2 base granule size running
> on a 16kB page size host, but that's not worse than doing nothing, and
> the host code won't get shouty.
> 
> Reported-by: Dan Carpenter <dan@pereq.eu>
> Link: https://lore.kernel.org/r/20261123-inval_range-v1-1-815e15797089@pereq.eu
> Fixes: d1de1576dc21 ("KVM: arm64: nv: Handle FEAT_TTL hinted TLB operations")
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
> 
> Notes:
>     Reposting this as a first class patch, as I'd like to plug that one
>     as early as possible (and Dan has plenty of other patches in flight...)

Tested-by: Dan Carpenter <dan@pereq.eu>

Although obviously zero is handled on the next line so there wasn't
much call for testing, but I still did do the testing.

regards,
dan carpenter

