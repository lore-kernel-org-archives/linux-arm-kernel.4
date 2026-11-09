Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78D4606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qdnYuS9t;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qqzgU1/T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tFD8H7/Nf5JeT+e6q4o34Y6AjhivafUR1oDuRLAxRhU=; b=qdnYuS9tHWbPoZ
	GUxr+dulJUoIKxjPNqdwSYh0Aj7+/tT9dRcCMVhCtKKQo107/JbRTUR99a3CttYwB8p78C/cPkUTc
	k+Pxm5shUnxorAdtwADS5b2nUF5LoPh1d1ROtyNfYUekykGIfBe2LXuLAk5pg+EtACirV1q+7l4Md
	9S7yVDVmKwRN+iEdKvMmFXctNNf9PCNTFjX2zVMM79CCs/MqZgl7yuTjm/HgM35nQydsyiW2EX49g
	/ahaVsKHg0o8+MZTM516XrMKi4fagDvasE2fDwdaygGnIDhZtXeEx/dOsouGl2Na2vlOTTQVAHQ84
	SLbZI/sKN9GI5yne4cxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNU7-00000000Vqm-44zx;
	Mon, 09 Nov 2026 11:24:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNU2-00000000Vom-2maB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:24:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93E6C15A1;
	Mon,  9 Nov 2026 03:24:14 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6F4E3F85F;
	Mon,  9 Nov 2026 03:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223457; bh=nln0kc6BV2hVEOB+OzjO0M5oIPooIl65a2MP9PKOLIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqzgU1/Te1nE4uHICXX1D6uD1aRILPNmfWR7J4CklpJLGkpH98tO/qJ/+awqKJ3NT
	 lfuRJCA/W0kRxDr6NARzrMPThFmpUeK21ILVARV/rxq532g8Q/oytcFWxlsQnZlAcS
	 8HAev+FwynDvfflxJ5htPJImwVP8AFAN/bCdA+gA=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: tnoc: fix trace ID path assignment failure on non-AMBA tnoc
Date: Mon,  9 Nov 2026 11:23:54 +0000
Message-ID: <179422341589.3275439.2394715793875768560.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
References: <20260902-fix-trace-id-error-in-tnoc-driver-v2-1-73669a947297@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_032418_751490_DAD92CB5 
X-CRM114-Status: GOOD (  10.16  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 02 Sep 2026 17:41:43 +0800, Jie Gan wrote:
> For a tnoc device not on the AMBA bus, atid was set to -EOPNOTSUPP.
> trace_noc_id() returns this value directly to
> coresight_path_assign_trace_id(), which only treats a literal 0
> return as "this device has no ID, keep searching the path" -
> any other value is checked against IS_VALID_CS_TRACE_ID() and
> rejected. A negative atid therefore made path assignment fail with
> -EINVAL instead of falling through to the next device in the path
> that could supply a valid trace ID.
> 
> [...]

Applied, thanks!

[1/1] coresight: tnoc: fix trace ID path assignment failure on non-AMBA tnoc
      https://git.kernel.org/coresight/c/bfe43f1d7905

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

