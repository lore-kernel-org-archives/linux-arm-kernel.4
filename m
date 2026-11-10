Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED83D606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xYgQ9/5j;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s+FQ+1/p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GoCnwF1puEjsvclXDKRQ/PkJe7axbawtj4cctZJn2N8=; b=xYgQ9/5j7QVuO/
	fIyxJCXSify+gkwAzDVwbY6JRO2/ykEl4i+Dc9EtUHxLrUC+eHBeUzfIuqLoQlquHuXqluCANyp64
	XXSx8fn9m0FxOEC0aePuN9IbMi7JVxtqpvh0UYA+E+T4R8mxvzayODqAXoYQT8hL2h1gzXumbmMTa
	5Why9tYT4iqqyORYSWJtq7zEybAG7ipsyWfcljK2tAqVzaoNFeAvA4DcBsSpaEYrWTKL+ZpjGpNZb
	/xD66EmNUj33s3mgwAfel0qNSLBkC+Z+zzxz6p8BpRnp6DqZFGsu32URCXsHF8qbfaX4wWdWLcCM5
	dEgB+CoP+5aHLyOkspkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkJ3-00000003fwS-3O79;
	Tue, 10 Nov 2026 11:46:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkJ1-00000003fve-0jZl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 11:46:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0FA1516;
	Tue, 10 Nov 2026 03:46:21 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D1E983F632;
	Tue, 10 Nov 2026 03:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794311184; bh=1KCGDNOweh5cRaCOrq0Ugdosxtb+ahsd5ag7b76Wa8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+FQ+1/pvH0amBPGuFOfYpeNPht5igu72Kis1moza4Y2ZwmQeU1O/RcpRqkmM4S1A
	 TNCz737d1tOTcjJlq71TdFyhynz+fupNXiOJA2jTdX3yif2pSOTaSsaP9xU5Fx5sgW
	 N1K0r9FpkCXOdDXCTYjpE1+sITP53SoZurCT8HHw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM platforms
Date: Tue, 10 Nov 2026 11:46:15 +0000
Message-ID: <179431113320.3326008.11214272306127557878.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034627_252136_E9B878AC 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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


On Tue, 10 Nov 2026 09:21:13 +0800, Jie Gan wrote:
> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> forces the device onto the AMBA bus, where the driver must read the
> peripheral ID from the device registers during probe. On several QCOM
> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> never probes and its trace path is unavailable.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: arm: coresight-tnoc: Bind on platform bus instead of AMBA
      https://git.kernel.org/coresight/c/76e192f4d40a
[2/5] coresight: tnoc: Bind Aggregator TNOC on the platform bus
      https://git.kernel.org/coresight/c/4d443f2e0956
[3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the platform bus
      https://git.kernel.org/coresight/c/50e7796ab751
[4/5] arm64: dts: qcom: sm8750: bind traceNoC on the platform bus
      https://git.kernel.org/coresight/c/f599d281541e
[5/5] arm64: dts: qcom: glymur: use Aggregator TNOC compatible
      https://git.kernel.org/coresight/c/1352ce9c99bd

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

