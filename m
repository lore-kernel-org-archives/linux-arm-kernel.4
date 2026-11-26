Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB095606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y7Ct1nmn;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GNzdroPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=; b=y7Ct1nmn9ItoiSmBEUkTYhXkAK
	Xx9ZK5VKOshb7CkNQrt/GZOKHg0ZMo/6O+GksEjoVqOUqvs7vgbqRabHSK7FAuOyD7wXjdh6HkS71
	7eNDhdvgJNZ2J5KHJgPjxYQbyzJPzWD9/6/g+76SmifClUSp7LW5XRfxk+5mrg5/h86K4MoOZ/EKM
	6YjlNw3frVF3vH+dLVhVfOPgcFf7BUfgv1vU2CIy7gD77hnfjKBH5cDQ//Vk4GeAF2P9BkDvenmHH
	umPW0SifUVyMtmpq2HQ0kpsiVzS6mgnmkgiE9DR8UGkX2HcmVtP+OGMWjaiYaPCsIB2dWk5nrhkSA
	7N22hJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWnn-0000000Ckuk-0xcW;
	Thu, 26 Nov 2026 10:34:07 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWnk-0000000Cktx-2ggV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 10:34:06 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-3282db206d3so2534270eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795689244; x=1796294044; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=GNzdroPsYfHRU1JXLTSwTuGObrhhYet3CCLV8GOOUv/jx+ScufxXjnv8VBoDnkiY6k
         6Qs/A/ezx5bpFyXvorYL8HVN8+odd9bYHYqPtlnjpyslnNZk1m3I8eAw8Gx8+Ah7BSwk
         RV+DNEIzo2jNt/gRNn2Y5wC518fqOpN/EdIrU9q2LNnzf9pReAWVrCW9fWHl8NF2Fhbx
         fCJkUqBi2dIM9gZIyPQ9SluLVVdLdp0o4atcfLOC8KkuWPxG4WoU9VSNHVE5i6XXWDUI
         l+0jUNnqRdOn4nb0dGnaEMG7B6LNS7YNnnnJK9dDK2zJkCCifmldMZrMXwWdgwOgZnO4
         djZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689244; x=1796294044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUY9+Y2VxoEdHCsHD5R8MfHCWDCl4kBtw61OaYnUOhg=;
        b=n9xYmXIv7ghz5pjLOP5PblavsyVKUNB0IdxGpuqAffmeX+pXsrozmkBK2xppkaor+V
         3L01TEUJ7OmnTcR2tzgdZcpAXqXJjJK/7W5E7ysfbECHAVVUIsQGilYZU8BT+19b5ZqV
         JGgraLf2qxMwW+hpE3YTVz6U83XIreKRvcjnX8fGL3Xv9DPAJYcqeKoXw14H7DnsIdJa
         6vXwemq4b4riwuVO4ZGphF+U/Thu2e5lKWI2EXut4MT1ZZDxqFILfjhlq2MW6lfcqYTD
         KtXZTrHhS7yx7cOZAiPwsW30bOEEJvtDJi1dilKDBWHzN2rmaHCVngX4CjVs+IgBL2JP
         LEXg==
X-Forwarded-Encrypted: i=1; AL+hErE1qM4hQJknHcRUmUZSNIxkkivBB2OHMuZntXqj8+a/KBxZ77hl45c3WApsgTWD9UtCVJhIugfLMduAo1EY9+IB@lists.infradead.org
X-Gm-Message-State: APuU4Z+6VyE2P0Bf6JH8UU+cHMkAiHDL58WaG2cTykgKuAPBKSyp95Ye
	YA0RFmSbB7Vgi5H6r2+LX+hvZa0F8tP2zuVBojByiFWvxt7Uzj4Lq9Dd8VgOm2Yq+tk=
X-Gm-Gg: AZFdTZcDz+19gCpL/ok00ULf1NYNjBINlXuEBN24t2wmHdJ4qimIM9MX7B8a1eLu4do
	IB/T35izeNuAd4SImQVQFp2DSMhU/kXtlzwTrPhr4IdV57kJnFfwqAo7M0fAnaio58/Kr1Ec9JO
	NH/C1bibiorBIXgeEHSZIfT5f9+LSHD2PX7YOcnv50RRz+DTztbUlv5dFpl9U8KOdzS5+/RbiLF
	aSr0PvmAgS9QfKej9N84RC5B9fAAZX39SEQJRwHgjF6+EDu4CB5LdgUIO1GNKs8ba1Hra6DbJUe
	djuJJ2KLnRYucU35fN50Aw1SXnwtxphaqXnHdCzkZnYp/d2xanD/u1/TSdNfkfT92yp4Ge3qKxT
	4StYz60pF6yJl2OGwc5Kc5099pD8+TmQdFxmPRX+BXfgjD3J5Ffaz3gf0BX14DXQnC2cH82hvPU
	kOKbZrlCbyrLO59qZECRTLOBXrvwOD8dfiQA7G1Xmce2OyI+X7K0tQ5ZbRlDZn3Zew/r1myDSWK
	uaiNXNIV1Gbgxho6GGMwUD4NxDrXqgOYtOR7qNO52VfyEFIkNynC8XfOrqcdqD3dfpKkh1h2+Zz
	gelOC1i9FWcOr0N72/774SvsJuNVxQ==
X-Received: by 2002:a05:7301:dc3:b0:386:ce5a:41aa with SMTP id 5a478bee46e88-386ce5a47f9mr4653486eec.13.1795689243454;
        Thu, 26 Nov 2026 02:34:03 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm76487652eec.11.2026.11.26.02.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:34:02 -0800 (PST)
Date: Thu, 26 Nov 2026 16:04:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	christian.koever-draxl@student.uibk.ac.at,
	neil.armstrong@linaro.org, sboyd@kernel.org, bmasney+clk@redhat.com,
	khilman@baylibre.com, rafael@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <awgLGFpH73_fcnbC@vireshk-B250M-D3H>
References: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
 <CAFBinCBkJJeRPKLFBA9KYjwXMxFjow_NOtvFoKRQdxD=rOPW3w@mail.gmail.com>
 <48b333a3-ef88-4739-a087-3ed9d8ec60a4@amlogic.com>
 <CAFBinCCgmRmk--W53wqdJhF-SzJbai--s7wyzDNt3LpfN00spw@mail.gmail.com>
 <b606819a-661e-4488-b5fb-9e786de463c6@amlogic.com>
 <awe_Wur5fVbeqV2d@vireshk-B250M-D3H>
 <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dbf65eb-fd04-41a3-876b-e2941cc10172@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_023404_701421_FCDE641F 
X-CRM114-Status: UNSURE (   9.43  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-26, 17:49, Chuan Liu wrote:
> Yes, as shown in this patch [1], I forced the above two
> "assert_single_clk()" to "assert_clk_index()" and it worked.

Maybe this is the right thing to do:

Functions using assert_single_clk(fixed-index-0), can be converted to
assert_clk_index(fixed-index-0). Lets make this change in the OPP core (in a
separate patch).

-- 
viresh

