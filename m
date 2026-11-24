Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SzwVVc7R;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qYB8UCUC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7A4T0Eyzg6Kcfbuj1hioukrhwGcSeqR+pvEasQ+qb4o=; b=SzwVVc7RBmSn1WBXf+fTxkfPvk
	Eh1jVPW5qBi5ZT2Bz9j0fIMcGz98uxyEUaXErvngHg8ZO26bOMetkJ2sY7KmgAStzSGKaeODT8xzN
	vApsjUwso2/A8N5sduVoiMef0ISrxWIEzROIhbFItvnfo5W6f1ZMrQop9enTD+u7+P5VJv8OyPSIO
	QpkgieOtx+YZd/APJl9DH919YB2oAHxqMfCAJYQtebYJPan9N4T4xqcGEizJ3+yrW2XJuANnPaTVq
	wzWpsPXkax7UsPdU3K1R+HudvUnUESaYvUesT33X4nZ7gtUHYgzHpZlCx9InRv6Cb1+A1xiNVpMfT
	F0cJNiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvtO-00000007ZYC-2zZB;
	Tue, 24 Nov 2026 19:09:26 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvtM-00000007ZXq-1NWM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:09:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrChWbZ5NqX7YBJuORtr5eud5WFy7ADakGOj+iix7IL5l9cNZeuDZfg+ipmbDzeIK9pXJA+6SZrOzU9N1/frlLsM43iLlfOPIXZBIRDL/Wzu4XHuAnfoZXqYr16KQxA8Ts2CKj2xtn7t0UhG0wP3nE8Jlf+Z3+nMMuDPsBvoOeR8gdth4V7BBRyXOIqFfJ3RdYW7gVBLa40SKmmRShlGQEKyB0CW4oDNpQN+YCBJnu7tK7VbFFGsJAqC5HQd4sm+tmC2lNPb9v6D+om1b02C++T22osERr4KnUWbCAAVj1WqXcj0TAkmzd3AGYsgO51gNS6neESNmJMVfG97UKJD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7A4T0Eyzg6Kcfbuj1hioukrhwGcSeqR+pvEasQ+qb4o=;
 b=Tonc6NqXzkU9+EwB7ezktLWVpKzL+My5GoHnJvByFn1Hc/mLQj7V9u1XUKq9ZHCMdlMiq5T7muUqDzwBZUEphnBZMxS5t2sZSNsW3qcUDXYntZGLhJ30dyzC88C/e5G8K6ylwFomVi1EeTJA3bTulwMJJt3cFxJTOyqZWR8+TUoXFhB1fHcGF4jm6fP5ghYpbdiKF9+rC0ZKlocQuMLp6qIt8AfxL402nUwCyUzj0ntjihOBmzrvMT7hfvyf63jy4m5kSKWmYAlwpHlTqle+tFLRzbqVkmqU6NT/xQl5WgG4GTByy8gnwrOJgHWNdWWk5ISrH88Ge4Sj5SXRjaxezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7A4T0Eyzg6Kcfbuj1hioukrhwGcSeqR+pvEasQ+qb4o=;
 b=qYB8UCUCwh1zrOuD5/VFZefQRHYCbBCN4xZqH+2LHnggkoNk6vqw3h7jbSdEZczpjTjmajlW1osK1q4f97/3JXFwr/jlKXX1zQYaESnxVajRDPtxPsPwfUmNqrSesUu59yYDerZoM6ms33V0x8ApYCIqJXIPFFbf3sG13OvsJl5CmtE+W0NJ266BCFfzlvpjUYt6pDYnG9oaTQYT/O3Morc07+sqlfaPXXNlhchJArVNq+cMe0mp6pb5OvWdTOYJtT48L6Ba3P9pRXMMkdEi1czVyoDxjIbf8wWo/rXgze4xBi0UI6feN/pken3mz+ykwMDy4V+KnCZhxglG/fuSgA==
Received: from SJ0PR03CA0161.namprd03.prod.outlook.com (2603:10b6:a03:338::16)
 by IA4PR12MB338606.namprd12.prod.outlook.com (2603:10b6:207:128::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 19:09:16 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::2b) by SJ0PR03CA0161.outlook.office365.com
 (2603:10b6:a03:338::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Tue,
 24 Nov 2026 19:09:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 19:09:15 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 11:08:57 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 11:08:57 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 11:08:56 -0800
Date: Tue, 24 Nov 2026 11:08:52 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "John
 Garry" <john.garry@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<patches@lists.linux.dev>, Pranjal Shrivastava <praan@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 05/13] iommupt/kunit: Skip test configs without
 supported features
Message-ID: <awXgxBCNDzh/32cm@nvidia.com>
References: <0-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <5-v3-97feb2edfbab+748d0a-iommupt_armv8_jgg@nvidia.com>
 <awUg0O0WQUBcuUvC@nvidia.com>
 <20261124150843.GC8680@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261124150843.GC8680@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|IA4PR12MB338606:EE_
X-MS-Office365-Filtering-Correlation-Id: 80091437-8351-439e-e939-08df4a5e6efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|18002099003|6133799003|22082099003|260925021911599003|260925021311599003|261009223027099003|260925022911599003|261021135927099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|10067099003|4143699003|261102123227099003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zZJxTO1pAhAH6LaGlNGofr2AGljC1moLP04DGDzTq+RijqCRhZ671alVIu6erbQocgQUiR/kUamru9/K/APNzjDEzAGs7C8iTrLI9N0eXWfHvsQf2qEymYILfVvlP7HY86vK6KCNcanggvuLuhx4SeJbT/c+24wwVoOXH3TfhMX0iL3f1U8i1MdPLKfOWGefKdWnqrazVPTV0PBXmTU6DHsEjUnOi9upaur0r0UNVmYSZg4STRlKzYE8ENvjdMdn+nLQXTX6TWKseGFLURDpnGlPx+IES7fP70IniWgDeI0sjvu1F+aeKb+kppnGiEt+usVG7Q3Uqoas7FkRtOaVyEl4rXuqQ+gqqfTewlAUqh9MTfmv2AzSjZFvdC1VK7WLkwn69m8r6WiH7bxn3i2KbOwzuoedZicqUXQ7QtuTPWc5phKrTN4sVZLAnwEBipcGwn9KrYdIZFH6knDdcoT9ehZpmfwQ/HOszhsjRgaiQg4GlILAlixsU4TwPTDysKqVe2vk9/u4pbUhvXkEKN/SPkFA8PzkEIkW3dZg05BVwWuWcoMqH2/2wPllqAqRW5WwMDNJTZJd2dz3lFUvvip73KxWuFTkiMidqE4ebWQ/jdn17ytNwQrObiH3F27djDYkPVi9RPsOlR2YwogUgjp809Tvg9ZjziMIIm4+kqrKTTS+PDYga77vxqjDRdHW8Nl0+3WYV0YWQ+37+G2sIy+5Sg==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(18002099003)(6133799003)(22082099003)(260925021911599003)(260925021311599003)(261009223027099003)(260925022911599003)(261021135927099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(4143699003)(261102123227099003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Zi1fjQekSJxI/628uxmnlNnWULSBziaStAgcpaRdjL5uOAjI4zte6mNgJq3PGoXbxobDfpgAexnwddv558qvbJsqybpMiOczCSRtDgPPLHYN8wLr0LXRiemTt5ZcGXrRc/4qzGYCqncPD4CrEwODtZ4+5c3dgvsdQmVWwZPbrYo9qFe7J8KObpwGNfRT9biM2qZwcpEVRoXaYyxr2A+kDdwzg8KEr8t7xSR7AjmSkWaH1mJcKPgowudU5X+ZFrSDyRhsi9WbrbTP3T+pZ2plUbjtsrJSWbGY84wZe26YJKPAp2MTzHXtLP66JP/cen00jtGd2HsGFa6QjRqBFMZ1zEnA/GMD5hB9YyLldYru+zpqxU6tP3cwgd+xMU8cJ0FBYjbYZI+diNI/KZb4wT9uoyJsoUeaPZFWlb4Y2fz+rOlWiBs+SgXh9z2ifh27i6vl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 19:09:15.9099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80091437-8351-439e-e939-08df4a5e6efc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB338606
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_110924_372935_840889FD 
X-CRM114-Status: GOOD (  13.47  )
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

On Tue, Nov 24, 2026 at 11:08:43AM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 23, 2026 at 09:29:52PM -0800, Nicolin Chen wrote:
> 
> > The leak check reads NR_SECONDARY_PAGETABLE with global_node_page_state().
> > That only returns the global counter. Each CPU also keeps a small delta of
> > page updates that is folded into the global counter only after it exceeds
> > a threshold. So the value can be off by a few pages without any leak.
> 
> There is a patch already in my tree to deal with this, this test only
> works when you use the kunit runner

6e8127719449e kunit: tool: catch warnings generated by the kernel

You mean this one? It doesn't fix the leak-check failure though.

The test can pass with a UML runner but fails running with arm64:

  $ ./tools/testing/kunit/kunit.py run \
        --kunitconfig=drivers/iommu/generic_pt
  Testing complete. Ran 482 tests: passed: 426, skipped: 56

  $ ./tools/testing/kunit/kunit.py run --arch=arm64 \
        --kunitconfig=drivers/iommu/generic_pt
  Testing complete. Ran 482 tests: passed: 3, failed: 478, skipped: 1

It's likely because UML has CONFIG_SMP=n, so global_node_page_state()
is good enough.

If the test is supposed to run with the UML only, let's ignore the
other case then.

Nicolin

